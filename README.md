# dotfiles

nix-darwin + home-manager による macOS 環境

## セットアップ

```sh
# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Nix
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

# 適用
git clone <repo> ~/dotfiles && cd ~/dotfiles
sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake .#mac --impure
mise install
```

## 更新

```sh
sudo darwin-rebuild switch --flake ~/dotfiles#mac --impure
```

## 手動

- API キー: `~/.config/zsh/secrets.zsh`
- SSH / git
- Caps Lock、ログイン項目
- Claude Code: `curl -fsSL https://claude.ai/install.sh | bash`
