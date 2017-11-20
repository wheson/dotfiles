function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
  bind \c] peco_select_ghq_repository  # 追加
end

export XDG_CONFIG_HOME=~/.config

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/wheson/google-cloud-sdk/path.fish.inc' ]; if type source > /dev/null; source '/Users/wheson/google-cloud-sdk/path.fish.inc'; else; . '/Users/wheson/google-cloud-sdk/path.fish.inc'; end; end
