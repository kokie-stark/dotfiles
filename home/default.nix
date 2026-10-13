{ config, pkgs, username, ... }:

let
  # 設定ファイルはリポジトリへのシンボリックリンクにする。
  # ~/dotfiles を編集すれば darwin-rebuild なしでそのまま反映される
  dotfiles = "${config.home.homeDirectory}/dotfiles";
  link = path: config.lib.file.mkOutOfStoreSymlink "${dotfiles}/${path}";
in
{
  imports = [ ./vscode.nix ];

  home.username = username;
  home.homeDirectory = "/Users/${username}";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    neovim
    ffmpeg
    cmake
    watchman
    deno
    uv
    awscli2
  ];

  home.sessionPath = [
    "$HOME/.local/bin" # uv で入れた Python、Claude Code など
    "$HOME/Library/pnpm"
  ];

  home.sessionVariables = {
    PNPM_HOME = "$HOME/Library/pnpm";
    CLICOLOR = "1";
    LSCOLORS = "GxFxCxDxBxegedabagaced";
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      ls = "ls -G";
      grep = "grep --color=auto";
      ll = "ls -lAh";
    };
    profileExtra = ''
      eval "$(/opt/homebrew/bin/brew shellenv)"
    '';
    initContent = ''
      # API キーなどの秘密は nix で管理しない。~/.config/zsh/secrets.zsh に書く
      [ -f "$HOME/.config/zsh/secrets.zsh" ] && source "$HOME/.config/zsh/secrets.zsh"
    '';
  };

  # プロンプトは starship に統一（PS1 は使わない）
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.mise = {
    enable = true;
    enableZshIntegration = true;
    globalConfig.tools = {
      node = "lts";
      pnpm = "latest";
      "npm:firebase-tools" = "latest";
      "npm:mcp-obsidian" = "latest";
      "npm:marked" = "latest";
    };
  };

  xdg.configFile = {
    "starship.toml".source = link ".config/starship.toml";
    "wezterm/wezterm.lua".source = link ".config/wezterm/wezterm.lua";
    "nvim/init.lua".source = link ".config/nvim/init.lua";
  };
}
