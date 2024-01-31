# Prompt help
#
dot=${HOME}/.config

confirm () {
    read -p "${1}? [y|n]" yn
    echo
    if [[ $yn =~ ^[yY]$ ]]; then
        return 0
    else
        return 1
    fi
}

# Zsh
if confirm "fish"; then

fi

