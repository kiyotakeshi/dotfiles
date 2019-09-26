- control + r でpecoを起動

```
❰kiyotatakeshi❙~❱✔≻ cat ~/.config/fish/config.fish

function fish_user_key_bindings
    bind \cr 'peco_select_history (commandline -b)'
end

```

- fisher(パッケージマネージャー)を導入
    - [参考](https://qiita.com/tenten0213/items/fae76efe326e683f91d1)

```
❰kiyotatakeshi❙~❱✔≻ curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
```

- fisherからpecoをインストール

```
❰kiyotatakeshi❙~❱✔≻ fisher add oh-my-fish/plugin-peco
```