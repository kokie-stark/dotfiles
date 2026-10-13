{ config, ... }:

let
  dotfiles = "${config.home.homeDirectory}/dotfiles";
  link = path: config.lib.file.mkOutOfStoreSymlink "${dotfiles}/${path}";
in
{
  # settings.json / keybindings.json はリポジトリへのリンク。VSCode の画面から変えた内容もリポジトリに入る
  # 拡張機能は darwin/vscode.nix
  home.file = {
    "Library/Application Support/Code/User/settings.json".source = link "vscode/settings.json";
    "Library/Application Support/Code/User/keybindings.json".source = link "vscode/keybindings.json";
  };
}
