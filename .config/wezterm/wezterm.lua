local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- ══════════════════════════════════════════════
--  カラースキーム
-- ══════════════════════════════════════════════
-- お好みで変更可: 'Catppuccin Mocha', 'Dracula', 'Gruvbox Dark', 'Nord' など
config.color_scheme = 'Tokyo Night Storm'

-- ══════════════════════════════════════════════
--  フォント
-- ══════════════════════════════════════════════
-- HackGen Console NF は日本語も等幅で綺麗に表示できるおすすめフォント
--   brew install --cask font-hackgen-console-nf
-- で入ります。無ければ JetBrains Mono や Menlo にフォールバック
config.font = wezterm.font_with_fallback {
  { family = 'HackGen Console NF', weight = 'Regular' },
  { family = 'JetBrains Mono',     weight = 'Medium'  },
  { family = 'Hiragino Sans',      weight = 'Regular' },
}
config.font_size = 14.0
config.line_height = 1.15
config.freetype_load_target = 'Light'
config.freetype_render_target = 'HorizontalLcd'

-- ══════════════════════════════════════════════
--  ウィンドウの見た目
-- ══════════════════════════════════════════════
config.window_background_opacity = 0.85       -- 透過度 (0.0〜1.0)
config.macos_window_background_blur = 30      -- macOS の背景ブラー
config.window_decorations = 'RESIZE'          -- タイトルバー非表示・リサイズは可
config.window_padding = {
  left = 24, right = 24, top = 20, bottom = 16,
}

-- ══════════════════════════════════════════════
--  タブバー
-- ══════════════════════════════════════════════
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true               -- タブを下に配置するとスッキリ
config.hide_tab_bar_if_only_one_tab = true    -- タブが1つなら非表示
config.tab_max_width = 32
config.show_new_tab_button_in_tab_bar = false

-- ══════════════════════════════════════════════
--  カーソル
-- ══════════════════════════════════════════════
config.default_cursor_style = 'BlinkingBar'
config.cursor_blink_rate = 600
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'

-- ══════════════════════════════════════════════
--  その他の調整
-- ══════════════════════════════════════════════
config.enable_scroll_bar = false
config.audible_bell = 'Disabled'
config.window_close_confirmation = 'NeverPrompt'
config.adjust_window_size_when_changing_font_size = false
config.front_end = 'WebGpu'                   -- GPU アクセラレーション

-- 非アクティブなペインを少し暗くしてフォーカスを分かりやすく
config.inactive_pane_hsb = {
  saturation = 0.85,
  brightness = 0.75,
}

-- ══════════════════════════════════════════════
--  キーバインド (ペイン分割など)
-- ══════════════════════════════════════════════
config.keys = {
  -- Cmd + d で縦分割 / Cmd + Shift + d で横分割 (iTerm2 風)
  { key = 'd', mods = 'CMD',       action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'd', mods = 'CMD|SHIFT', action = wezterm.action.SplitVertical   { domain = 'CurrentPaneDomain' } },
  -- Cmd + w でペインを閉じる
  { key = 'w', mods = 'CMD', action = wezterm.action.CloseCurrentPane { confirm = false } },
  -- ── macOS 風の行移動 ──
  -- Cmd + ← : 行頭へ (Ctrl+A 相当)
  { key = 'LeftArrow',  mods = 'CMD', action = wezterm.action.SendKey { key = 'a', mods = 'CTRL' } },
  -- Cmd + → : 行末へ (Ctrl+E 相当)
  { key = 'RightArrow', mods = 'CMD', action = wezterm.action.SendKey { key = 'e', mods = 'CTRL' } },
  -- Cmd + Delete : 行頭まで削除 (Ctrl+U 相当)
  { key = 'u',  mods = 'CMD', action = wezterm.action.SendKey { key = 'u', mods = 'CTRL' } },

  -- ── ペインのリサイズ (Cmd + Shift + 矢印) ──
  { key = 'LeftArrow',  mods = 'CMD|SHIFT', action = wezterm.action.AdjustPaneSize { 'Left',  5 } },
  { key = 'RightArrow', mods = 'CMD|SHIFT', action = wezterm.action.AdjustPaneSize { 'Right', 5 } },
  { key = 'UpArrow',    mods = 'CMD|SHIFT', action = wezterm.action.AdjustPaneSize { 'Up',    5 } },
  { key = 'DownArrow',  mods = 'CMD|SHIFT', action = wezterm.action.AdjustPaneSize { 'Down',  5 } },

  -- ── ペイン間の移動 (Cmd + Option + 矢印) ──
  { key = 'LeftArrow',  mods = 'CMD|OPT', action = wezterm.action.ActivatePaneDirection 'Left'  },
  { key = 'RightArrow', mods = 'CMD|OPT', action = wezterm.action.ActivatePaneDirection 'Right' },
  { key = 'UpArrow',    mods = 'CMD|OPT', action = wezterm.action.ActivatePaneDirection 'Up'    },
  { key = 'DownArrow',  mods = 'CMD|OPT', action = wezterm.action.ActivatePaneDirection 'Down'  },

  -- ── ペインを最大化/戻す (Cmd + Enter) ──
  { key = 'Enter', mods = 'CMD', action = wezterm.action.TogglePaneZoomState },
}

return config
