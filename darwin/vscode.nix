{ ... }:

{
  # VSCode の拡張機能（brew bundle で入れる。VSCode 本体は homebrew.nix の cask）
  homebrew.vscode = [
    # Prettier / TypeScript
    "esbenp.prettier-vscode"
    "yoavbls.pretty-ts-errors"
    "rvest.vs-code-prettier-eslint"

    # Python / Jupyter
    "ms-python.python"
    "ms-python.vscode-pylance"
    "ms-python.debugpy"
    "ms-python.vscode-python-envs"
    "ms-toolsai.jupyter"
    "ms-toolsai.jupyter-keymap"
    "ms-toolsai.jupyter-renderers"
    "ms-toolsai.vscode-jupyter-cell-tags"
    "ms-toolsai.vscode-jupyter-powertoys"
    "ms-toolsai.vscode-jupyter-slideshow"
    "ms-toolsai.datawrangler"

    # AI
    "anthropic.claude-code"

    # Vim
    "vscodevim.vim"
    "asvetliakov.vscode-neovim"

    # Git
    "eamodio.gitlens"
    "seatonjiang.gitmoji-vscode"

    # React / TS
    "dsznajder.es7-react-js-snippets"
    "burkeholland.simple-react-snippets"
    "vitest.explorer"
    "expo.vscode-expo-tools"
    "prisma.prisma"

    # テーマ・アイコン
    "catppuccin.catppuccin-vsc"
    "catppuccin.catppuccin-vsc-icons"
    "enkia.tokyo-night"
    "qufiwefefwoyn.kanagawa"
    "vscode-icons-team.vscode-icons"

    # その他
    "ms-ceintl.vscode-language-pack-ja"
    "redhat.vscode-yaml"
    "mechatroner.rainbow-csv"
    "streetsidesoftware.code-spell-checker"
    "formulahendry.code-runner"
    "evgeniypeshkov.syntax-highlighter"
    "alexlapwood.open-editors-tree-view"
  ];
}
