{ ... }:

{
  # GUI アプリと、nixpkgs より Homebrew の方が扱いやすいものはここで入れる
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = false;
      upgrade = false;
      # ここに無いアプリは消さない。"uninstall" / "zap" にするとリストに無いものを削除する
      cleanup = "none";
    };

    brews = [
      "libomp" # Python の ML ライブラリが /opt/homebrew/opt/libomp を探すため
    ];

    casks = [
      # ブラウザ
      "google-chrome"
      "brave-browser"
      "zen"

      # エディタ・ターミナル
      "visual-studio-code"
      "ghostty"
      "wezterm"

      # AI・開発ツール
      "claude"
      "gcloud-cli" # 旧名 google-cloud-sdk。gcloud の自己更新は nix と相性が悪いので brew で入れる

      # 仕事・コミュニケーション
      "slack"
      "drawio"
      "obsidian"

      # ユーティリティ
      "logi-options+"
      "maccy"
      "rectangle"
      "vlc"

      # キーボード
      "hhkb"
      "hhkb-studio"

      # フォント（wezterm.lua の HackGen Console NF）
      "font-hackgen-nerd"
    ];
  };
}
