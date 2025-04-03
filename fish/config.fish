if status is-interactive
    # Commands to run in interactive sessions can go here
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/edo/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/edo/Downloads/google-cloud-sdk/path.fish.inc'; end
