set fish_theme agnoster

# alias
balias g git 

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/google-cloud-sdk/path.fish.inc' ]; if type source > /dev/null; source '$HOME/google-cloud-sdk/path.fish.inc'; else; . '$HOME/google-cloud-sdk/path.fish.inc'; end; end

set PATH ~/.composer/vendor/bin $PATH

set PATH ~/.anyenv/bin $PATH

# rbenv path
set -x RBENV_ROOT $HOME/.anyenv/envs/rbenv
set -x PATH $PATH $HOME/.anyenv/envs/rbenv/bin
set -gx PATH $HOME/.anyenv/envs/rbenv/shims $PATH
set -gx RBENV_SHELL fish
source $HOME/.anyenv/envs/rbenv/libexec/../completions/rbenv.fish

# phpenv path
set -x PHPENV_ROOT $HOME/.anyenv/envs/phpenv
set -x PATH $PATH $HOME/.anyenv/envs/phpenv/bin

# ndenv path
set -x NDENV_ROOT $HOME/.anyenv/envs/ndenv
set -x PATH $HOME/.anyenv/envs/ndenv/bin $PATH
set -x PATH $NDENV_ROOT/shims $PATH
set -x PATH $HOME/.anyenv/envs/ndenv/versions/v8.9.3/bin $PATH
