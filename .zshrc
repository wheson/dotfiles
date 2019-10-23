#PATH
export PATH=$PATH":/usr/local/opt/avr-gcc@7/bin"
typeset -U path PATH

# プロンプト
function init-prompt {
    ## 256 color
    local user_color="200"
    local host_color="057"
    local dir_color="147"

    local prompt='%F{'"${user_color}"'}%n%f@%F{'"$host_color"'}%m%f %F{'"$dir_color"'}%d%f'
    ## 改行
    prompt=$prompt'
'

    ## マスコット表示
    prompt=$prompt'%(?!(>_<) < !(?_?%) < '

    echo $prompt
}
PROMPT=`init-prompt`

# ブランチ名を色付きで表示させるメソッド
function rprompt-git-current-branch {
  local branch_name st branch_status

  if [ ! -e  ".git" ]; then
    # gitで管理されていないディレクトリは何も返さない
    return
  fi
  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    # 全てcommitされてクリーンな状態
    branch_status="%F{002}"
  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    # gitに管理されていないファイルがある状態
    branch_status="%F{001}?"
  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    # git addされていないファイルがある状態
    branch_status="%F{001}+"
  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    # git commitされていないファイルがある状態
    branch_status="%F{003}!"
  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    # コンフリクトが起こった状態
    echo "%F{001}!(no branch)"
    return
  else
    # 上記以外の状態の場合は青色で表示させる
    branch_status="%F{blue}"
  fi
  # ブランチ名を色付きで表示する
  echo "${branch_status}[$branch_name]"
}

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

# プロンプトの右側(RPROMPT)にメソッドの結果を表示させる
RPROMPT='`rprompt-git-current-branch`'

# zplug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
zplug zplug/zplug, hook-build:'zplug --self-manage'

## others
zplug zsh-users/zsh-syntax-highlighting
zplug zsh-users/zsh-autosuggestions

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load


# peco
function peco-history-selection() {
    case ${OSTYPE} in
        darwin*)
            #mac
            BUFFER=`history -n 1 | tail -r | awk '!a[$0]++' | peco`
            ;;
        linux*)
            BUFFER=`history -n 1 | tac | awk '!a[$0]++' | peco`
            ;;
        esac
        CURSOR=$#BUFFER
        zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=1000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

# 重複を記録しない
setopt hist_ignore_dups

# 開始と終了を記録
setopt EXTENDED_HISTORY
