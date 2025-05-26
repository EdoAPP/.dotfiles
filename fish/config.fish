if status is-interactive
    # Commands to run in interactive sessions can go here
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
set --export DOCKER_INSTALL "/Applications/Docker.app/Contents/Resources/"
set --export PATH $DOCKER_INSTALL/bin $PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/edo/Downloads/google-cloud-sdk/path.fish.inc' ]
    . '/Users/edo/Downloads/google-cloud-sdk/path.fish.inc'
end

# Source local secrets if the file exists
if test -f ~/.config/fish/secrets.fish
    source ~/.config/fish/secrets.fish
end
