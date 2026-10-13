{ username, ... }:

{
  imports = [
    ./homebrew.nix
    ./vscode.nix
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;

  # Determinate Systems のインストーラで入れた Nix を使うので、nix-darwin では Nix 本体を管理しない
  nix.enable = false;

  users.users.${username}.home = "/Users/${username}";
  system.primaryUser = username;

  # /etc/zshrc で nix のパスを通す
  programs.zsh.enable = true;

  system.defaults = {
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      AppleShowAllExtensions = true;
      "com.apple.swipescrolldirection" = true; # ナチュラルスクロール
      "com.apple.trackpad.scaling" = 2.5; # 軌跡の速さ
    };

    dock = {
      autohide = true; # option + command + D と同じ
      tilesize = 38;
      magnification = false;
      # ホットコーナー（1: なし / 2: Mission Control / 11: Launchpad / 12: 通知センター）
      wvous-tl-corner = 1;
      wvous-tr-corner = 12;
      wvous-bl-corner = 2;
      wvous-br-corner = 11;
    };

    finder = {
      QuitMenuItem = true; # Finder を終了できるようにする
      ShowPathbar = true;
      FXPreferredViewStyle = "clmv"; # カラム表示
      AppleShowAllExtensions = true;
    };

    trackpad = {
      Clicking = true; # タップでクリック
      Dragging = true; # タップでホールド（ドラッグ）
      TrackpadThreeFingerDrag = false;
      TrackpadThreeFingerTapGesture = 2; # 3本指タップで調べる
    };

    CustomUserPreferences = {
      NSGlobalDomain."com.apple.trackpad.forceClick" = false;

      # ターミナル.app のテーマを黒に
      "com.apple.Terminal" = {
        "Default Window Settings" = "Homebrew";
        "Startup Window Settings" = "Homebrew";
      };

      # Maccy: 自動貼り付け ON、ポップアップは control + V
      "org.p0deje.Maccy" = {
        pasteByDefault = true;
        KeyboardShortcuts_popup = ''{"carbonModifiers":4096,"carbonKeyCode":9}'';
      };
    };
  };

  # Caps Lock の英数/かな切替は手動で設定する（README 参照）

  system.stateVersion = 6;
}
