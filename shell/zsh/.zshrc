PROMPT='$ '

## タブ補完時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

## 日本語ファイル名を表示可能にする
setopt print_eight_bit

## ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

## Aliasの設定
# core
alias ll='ls -l'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# custom
alias iterm='open -a ~/Applications/iTerm.app .'
# alias cat=bat

# pecoの設定(cortrol+rで呼び出し)
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

# デフォルトで使用するjdk
export JAVA_HOME=`/usr/libexec/java_home -v 11`
# export JAVA_HOME=`/usr/libexec/java_home -v 14`
# export JAVA_HOME=`/usr/libexec/java_home -v "1.8"`

# zplug
source ~/.zplug/init.zsh

# タイプ補完
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-completions"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# direnv
eval "$(direnv hook zsh)"

# anyenv
eval "$(anyenv init -)"
