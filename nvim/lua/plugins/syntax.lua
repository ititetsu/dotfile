return {{
  "nvim-treesitter/nvim-treesitter",
  event = {'BufNewFile', 'BufRead'},
  build = ":TSUpdate",
  opts = {
    ensure_installed = {"lua", "vim", "bash", "typescript", "c", "python", "rust", "markdown"},
    highlight = {
      enable = true
    },
    autotag = {
      enable = true
    },
    sync_install = true
  }
} -- Markdown/AsciiDoc用
-- { "preservim/vim-markdown" },
-- { "habamax/vim-asciidoctor" },
}
