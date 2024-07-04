# -----------
# zplug 
## `brew install zplug`
export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

# Load theme file
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# 非同期処理できるようになる
zplug "mafredri/zsh-async"

# テーマ
zplug "sindresorhus/pure"

# 構文のハイライト(https://github.com/zsh-users/zsh-syntax-highlighting)
zplug "zsh-users/zsh-syntax-highlighting"

# コマンド入力途中で上下キー押したときの過去履歴がいい感じに出るようになる
zplug "zsh-users/zsh-history-substring-search"

# 過去に入力したコマンドの履歴が灰色のサジェストで出る
zplug "zsh-users/zsh-autosuggestions"

# 補完強化
zplug "zsh-users/zsh-completions"

# 256色表示にする
zplug "chrissicool/zsh-256color"

# コマンドライン上の文字リテラルの絵文字を emoji 化する
zplug "mrowa44/emojify", as:command

# alias の代わり
zplug "olets/zsh-abbr"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

# -----------
# mise
## https://mise.jdx.dev/getting-started.html
eval "$(~/.local/bin/mise activate zsh)"

# -----------
# abbr
## `alias ll='ls -lha'` のように書ける
abbr -S ll='ls -lha'

# -----------
# fzf
## `brew install fzf`
source <(fzf --zsh)

# -----------
# general
## terminal の表示はシンプルにしたい
export PS1="$ "



# -----------
# command snippet
## 標準出力に出しながらクリップボードに(Warp など使うなら不要)
## `cat ~/gitdir/sample/sample.json | tee >(pbcopy)`

