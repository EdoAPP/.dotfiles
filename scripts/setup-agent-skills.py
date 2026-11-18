#!/usr/bin/env python3
import argparse
import hashlib
import os
from pathlib import Path
import subprocess
import sys
from datetime import datetime, timezone


REPOSITORY = "git@github.com:EdoAPP/agent-skills.git"
ORIGINS = {REPOSITORY, "https://github.com/EdoAPP/agent-skills.git"}
SCOPES = ("codex", "agents", "claude", "cursor")
# Claude Code reads only ~/.claude/skills, so mirror shared ~/.agents skills there
# through relative links into ~/.agents/skills.
MIRRORS = {"agents": ("claude",)}


def fingerprint(directory):
    result = {}
    for path in sorted(directory.rglob("*")):
        relative = str(path.relative_to(directory))
        if path.is_symlink():
            result[relative] = ("link", os.readlink(path))
        elif path.is_file():
            result[relative] = (
                "file",
                hashlib.sha256(path.read_bytes()).hexdigest(),
                path.stat().st_mode & 0o111,
            )
        elif path.is_dir():
            result[relative] = ("directory",)
    return result


def install(repo, target_home):
    repo = repo.expanduser().absolute()
    target_home = target_home.expanduser().absolute()
    if not repo.exists():
        repo.parent.mkdir(parents=True, exist_ok=True)
        subprocess.run(["git", "clone", REPOSITORY, str(repo)], check=True)
    origin = subprocess.check_output(
        ["git", "-C", str(repo), "remote", "get-url", "origin"], text=True
    ).strip()
    if origin not in ORIGINS:
        raise ValueError(f"Unexpected repository origin: {origin}")

    pending = []
    claimed = set()
    linked = 0
    for scope in SCOPES:
        source_root = repo / scope / "skills"
        if not source_root.is_dir():
            continue
        for source in sorted(source_root.iterdir()):
            if source.name.startswith("."):
                continue
            if source.is_symlink() or not (source / "SKILL.md").is_file():
                raise ValueError(f"Invalid skill directory: {source}")
            targets = [(target_home / f".{scope}" / "skills" / source.name, source)]
            for mirror in MIRRORS.get(scope, ()):
                targets.append((
                    target_home / f".{mirror}" / "skills" / source.name,
                    Path("../..") / f".{scope}" / "skills" / source.name,
                ))
            for destination, link_target in targets:
                if destination in claimed:
                    raise ValueError(f"Skill name collides across scopes: {destination}")
                claimed.add(destination)
                if destination.is_symlink() and destination.resolve() == source.resolve():
                    linked += 1
                    continue
                if destination.is_symlink():
                    raise ValueError(f"Conflicting symlink; left untouched: {destination}")
                if destination.exists() and (
                    not destination.is_dir()
                    or fingerprint(destination) != fingerprint(source)
                ):
                    raise ValueError(f"Different local files; left untouched: {destination}")
                pending.append((link_target, destination))
    if not pending and not linked:
        raise ValueError(f"No skills found in {repo}")

    backup = target_home / ".local/share/agent-skills-backups" / datetime.now(
        timezone.utc
    ).strftime("%Y%m%dT%H%M%S.%fZ")
    backed_up = 0
    for link_target, destination in pending:
        destination.parent.mkdir(parents=True, exist_ok=True)
        saved = None
        if destination.exists():
            saved = backup / destination.relative_to(target_home)
            saved.parent.mkdir(parents=True, exist_ok=True)
            destination.rename(saved)
            backed_up += 1
        try:
            destination.symlink_to(link_target, target_is_directory=True)
        except OSError:
            if saved is not None:
                saved.rename(destination)
            raise
        print(f"Linked {destination} -> {link_target}")
    if backed_up:
        print(f"Preserved {backed_up} original directories in {backup}")
    print(f"Ready: {len(pending)} created, {linked} already linked. Checkout: {repo}")


def main():
    parser = argparse.ArgumentParser(
        description="Clone private agent skills and link them into their original agent folders. Requires git, Python 3, and GitHub SSH access. Existing clones are not pulled automatically."
    )
    parser.add_argument("--repo-dir", type=Path, default=Path.home() / "dev/agent-skills")
    parser.add_argument("--target-home", type=Path, default=Path.home())
    args = parser.parse_args()
    install(args.repo_dir, args.target_home)


if __name__ == "__main__":
    try:
        main()
    except (OSError, ValueError, subprocess.CalledProcessError) as error:
        print(f"Setup failed: {error}", file=sys.stderr)
        sys.exit(1)
