-- 行番号を表示
vim.opt.number = true          -- 通常の行番号
vim.opt.relativenumber = true  -- 相対行番号（便利！）

-- インデント設定
vim.opt.expandtab = true   -- タブをスペースに変換
vim.opt.shiftwidth = 4     -- 自動インデントの幅
vim.opt.tabstop = 4        -- タブ文字の幅
vim.opt.smartindent = true -- スマートインデント

-- 検索設定
vim.opt.ignorecase = true -- 大文字小文字を無視
vim.opt.smartcase = true  -- 大文字を含むと区別する
vim.opt.incsearch = true  -- インクリメンタルサーチ
vim.opt.hlsearch = true   -- 検索結果をハイライト

-- カーソル行列のハイライト
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

vim.opt.wrap = false

-- スクロール時の余白
vim.opt.scrolloff = 8

-- クリップボードをOSと共有（WSLでは別途設定が必要な場合あり）
vim.opt.clipboard = "unnamedplus"

-- タイトルを表示
vim.opt.title = true

-- ファイル保存時に自動でディレクトリを作成
vim.opt.autowrite = true

-- ターミナルの色を有効に
vim.opt.termguicolors = true

-- https://zenn.dev/vim_jp/articles/1b4344e41b9d5b

-- lazy.nvimのパスを設定
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- cursor
vim.opt.guicursor = "n-i:ver25"
-- ⌨️ キーマップ
require("keymaps")
require("tools.docgen")

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- 🧠 構文解析・補完・LSP
    { import = "plugins.syntax" },
    { import = "plugins.cmp" },
    { import = "plugins.lsp" },
    { import = "plugins.formatter" },
    { import = "plugins.mason" },

    -- 🔍 検索・ナビゲーション
    { import = "plugins.search" },

    -- 🐞 デバッグ
    { import = "plugins.debug" },

    -- 🗂 UI（ステータスライン・バッファ・ファイルツリーなど）
    { import = "plugins.ui" },

    -- 🧰 ツール（ターミナル・クリップボードなど）
    { import = "plugins.tools" },

    -- 🧑‍💻 Git連携
    { import = "plugins.git" },

    -- 🎨 カラースキーム・補助
    { import = "plugins.theme" },

    -- 📱lualine
    { import = 'plugins.lualine' },

  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})


-- vim.cmd [[
--   highlight CursorLine guibg=#44475a
--   highlight CursorColumn guibg=#44475a
-- ]]

vim.opt.list = true
vim.opt.listchars = {
  tab = '»·',
  trail = '·',
  extends = '»',
  precedes = '«',
  nbsp = '%'
}

vim.cmd [[highlight ExtraWhitespace ctermbg=red guibg=red]]
vim.cmd [[match ExtraWhitespace /\s\+$/]]
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    command = ":%s/\\s\\+$//e"
})
