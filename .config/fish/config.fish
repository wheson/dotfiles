set fish_theme agnoster

# alias
balias g git 

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/wheson/google-cloud-sdk/path.fish.inc' ]; if type source > /dev/null; source '/Users/wheson/google-cloud-sdk/path.fish.inc'; else; . '/Users/wheson/google-cloud-sdk/path.fish.inc'; end; end

status --is-interactive; and source (rbenv init -|psub)
