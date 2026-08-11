# dotfiles

WezTerm と Starship の設定ファイル。

## 構成

```
~/dotfiles/
├── .config/
│   ├── wezterm/
│   │   └── wezterm.lua   # WezTerm の設定
│   └── starship.toml     # Starship プロンプトの設定
├── install.sh            # ~/.config へシンボリックリンクを張る
└── README.md
```

`install.sh` は `.config/` 以下のファイルを `~/.config/` に **シンボリックリンク** します。
リポジトリ側を編集すれば、そのまま実環境に反映されます。

## 前提ツール

```sh
brew install --cask wezterm
brew install starship
brew install --cask font-hackgen-console-nf   # wezterm.lua が使うフォント
```

`~/.zshrc` に以下が必要です（未設定なら `install.sh` が警告します）。

```sh
eval "$(starship init zsh)"
```

## インストール

```sh
git clone <this-repo> ~/dotfiles
cd ~/dotfiles
./install.sh
```

| オプション | 説明 |
| --- | --- |
| （なし） | リンクを作成。既存ファイルは `*.bak.<timestamp>` に退避 |
| `--dry-run` | 実行内容を表示するだけで変更しない |
| `--force` | 既存ファイルを退避せず上書き |

### 注意: `~/.wezterm.lua`

WezTerm は `~/.wezterm.lua` を `~/.config/wezterm/wezterm.lua` より **優先** して読み込みます。
以前の設定が残っている場合は退避してください。

```sh
mv ~/.wezterm.lua ~/.wezterm.lua.bak
```

## 設定内容

### WezTerm ([.config/wezterm/wezterm.lua](.config/wezterm/wezterm.lua))

- カラースキーム: Tokyo Night Storm
- フォント: HackGen Console NF → JetBrains Mono → Hiragino Sans のフォールバック
- 背景の透過 + macOS ブラー、タイトルバー非表示
- タブバーは下部配置、1つのときは非表示
- WebGpu によるGPUアクセラレーション

主なキーバインド:

| キー | 動作 |
| --- | --- |
| `Cmd + d` / `Cmd + Shift + d` | ペインを縦 / 横に分割 |
| `Cmd + w` | ペインを閉じる |
| `Cmd + Enter` | ペインの最大化 / 復帰 |
| `Cmd + Opt + ←→↑↓` | ペイン間の移動 |
| `Cmd + Shift + ←→↑↓` | ペインのリサイズ |
| `Cmd + ←` / `Cmd + →` | 行頭 / 行末へ移動 |
| `Cmd + u` | 行頭まで削除 |

### Starship ([.config/starship.toml](.config/starship.toml))

`ユーザー名 → ディレクトリ → git ブランチ / 状態 → ❯` のみのミニマル構成。
言語バージョンやクラウド系のモジュールはすべて無効化しています。

## 設定の変更

リンク先はリポジトリ内のファイルなので、`~/dotfiles/.config/...` を編集して
そのままコミットできます。

```sh
cd ~/dotfiles
git add -A && git commit -m "update wezterm config"
```

## 追加したいとき

新しい設定を管理下に置く場合は、

1. `.config/` 以下にファイルを置く
2. `install.sh` の `TARGETS` にパスを追加する
3. `./install.sh` を実行する
