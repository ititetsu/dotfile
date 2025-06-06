# 🧠 構文ハイライト & 補完

### `nvim-treesitter/nvim-treesitter`
- **目的**：高精度な構文ハイライトとコード解析。
- **主な用途**：C や Rust など多言語対応。
- **コマンド**：`:TSUpdate` でパーサーを更新。

### `neovim/nvim-lspconfig`
- **目的**：LSP（Language Server Protocol）クライアントの設定を簡素化。
- **主な用途**：`clangd` などの言語サーバーと連携。
- **コマンド**：`:LspInstall <server>` で言語サーバーをインストール。

### `hrsh7th/nvim-cmp`
- **目的**：Neovim 用の補完エンジン。
- **主な用途**：LSP、スニペット、バッファなどから補完。
- **コマンド**：補完は自動でトリガーされる。

### `hrsh7th/cmp-nvim-lsp`
- **目的**：`nvim-cmp` に LSP 補完ソースを追加。
- **主な用途**：LSP 情報を使った補完の強化。
- **コマンド**：補完は自動でトリガーされる。

---

# 🔍 検索 & ナビゲーション

### `nvim-telescope/telescope.nvim`
- **目的**：ファイル、文字列、バッファなどのファジー検索。
- **主な用途**：高速な検索と移動。
- **コマンド**：
  - `:Telescope find_files`：ファイル検索。
  - `:Telescope live_grep`：ファイル内検索。
  - `:Telescope help_tags`：ヘルプタグ検索。

### `nvim-lua/plenary.nvim`
- **目的**：Neovim プラグイン用のユーティリティ関数。
- **主な用途**：Telescope などの依存ライブラリ。
- **コマンド**：直接のコマンドはなし。

---

# 🐞 デバッグ

### `mfussenegger/nvim-dap`
- **目的**：Neovim 用のデバッグフレームワーク。
- **主な用途**：C/C++/Rust などのデバッグ。
- **コマンド**：`:DapToggleBreakpoint` でブレークポイント切り替え。

### `rcarriga/nvim-dap-ui`
- **目的**：`nvim-dap` の UI。
- **主な用途**：ブレークポイント、変数、スタックなどの可視化。
- **コマンド**：`:DapUIOpen` で UI を開く。

---

# 🖼 UI & バッファ管理

### `nvim-lualine/lualine.nvim`
- **目的**：軽量でカスタマイズ可能なステータスライン。
- **主な用途**：モード、ブランチ、診断情報などの表示。
- **コマンド**：設定は `init.lua` にて。

### `nvim-tree/nvim-tree.lua`
- **目的**：ファイルツリーエクスプローラー。
- **主な用途**：視覚的なファイル操作。
- **コマンド**：
  - `:NvimTreeToggle`：ファイルツリーの表示切替。
  - `:NvimTreeFocus`：ファイルツリーにフォーカス。

### `akinsho/bufferline.nvim`
- **目的**：バッファをタブとして表示。
- **主な用途**：視覚的なバッファ管理。
- **コマンド**：
  - `:bprev`：前のバッファへ。
  - `:bnext`：次のバッファへ。

### `moll/vim-bbye`
- **目的**：ウィンドウレイアウトを崩さずにバッファを閉じる。
- **主な用途**：バッファのクリーンな削除。
- **コマンド**：`:Bdelete` でバッファ削除。

---

# 🧰 ツール & ユーティリティ

### `akinsho/toggleterm.nvim`
- **目的**：Neovim 内でターミナルを表示。
- **主な用途**：`lazygit` などの CLI ツール実行。
- **コマンド**：
  - `:ToggleTerm`：ターミナルの表示切替。
  - `:lua _lazygit_toggle()`：`lazygit` の表示切替。

### `ojroques/nvim-osc52`
- **目的**：OSC52 プロトコルでクリップボードにコピー。
- **主な用途**：SSH や WSL から Windows クリップボードへコピー。
- **コマンド**：ヤンク時に自動コピー。

---

# 🧑‍💻 Git 連携

### `lewis6991/gitsigns.nvim`
- **目的**：行ごとの Git 差分（追加、削除、変更）を表示。
- **主な用途**：ガターに変更を可視化。
- **コマンド**：設定は `init.lua` にて。

### `f-person/git-blame.nvim`
- **目的**：現在行の Git blame 情報を表示。
- **主な用途**：変更者と日付の表示。
- **コマンド**：自動で表示。

### `sindrets/diffview.nvim`
- **目的**：Git の差分と履歴をサイドバイサイドで表示。
- **主な用途**：コンフリクト解決や変更の確認。
- **コマンド**：
  - `:DiffviewOpen HEAD~1`：前のコミットとの比較。
  - `:DiffviewFileHistory %`：現在のファイルの履歴。
  - `:DiffviewClose`：差分ビューを閉じる。

---

# 🎨 テーマ & アシスタンス

### `catppuccin/nvim`
- **目的**：美しいカラースキーム。
- **主な用途**：`frappe`、`macchiato`、`mocha` などから選択。
- **コマンド**：`:colorscheme catppuccin` でテーマ適用。

### `folke/which-key.nvim`
- **目的**：キーマップのヒントを表示。
- **主な用途**：リーダーキー押下後に利用可能なキーを表示。
- **コマンド**：自動でヒントを表示。
