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
abbr -S today='echo $(date +%Y-%m-%d) | pbcopy'
abbr -S now='echo $(date +%Y-%m-%d-%H-%M) | pbcopy'
abbr -S 'g head'='git rev-parse --abbrev-ref HEAD | pbcopy'
abbr -S 'g branch-cleanup'='git switch main && echo before: $(git branch | wc -l) && echo delete unused branch && git branch | grep -v "main" | xargs git branch -d && echo after: $(git branch | wc -l)'
abbr -S 'g-rebase'='current_branch=$(git rev-parse --abbrev-ref HEAD) && git checkout main && git pull && git checkout $current_branch && git rebase main'
abbr -S 'gs'='git branch | fzf | xargs git switch'
abbr -S 'gui'='gitui'

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

# -----------
# for AWS
# export AWS_PROFILE=dev
export AWS_DEFAULT_REGION=ap-northeast-1
