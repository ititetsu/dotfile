return {{
  "lewis6991/gitsigns.nvim",
  config = function()
    require('gitsigns').setup {
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = function(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end
        map('n', 'gs', gs.preview_hunk)
        map('n', 'gr', gs.reset_hunk)
      end
    }
  end
}, {
  "f-person/git-blame.nvim",
  event = "VeryLazy",
  opts = {
    enabled = true,
    message_template = " <author>, <date> : <summary>",
    date_format = "%m-%d-%Y %H:%M:%S",
    virtual_text_column = 1
  }
}, {
  "sindrets/diffview.nvim",
  lazy = false,
  config = function()
    require("diffview").setup()
  end,
  keys = {{
    mode = "n",
    "<leader>dh",
    "<cmd>DiffviewOpen HEAD~1<CR>",
    desc = "1つ前とのdiff"
  }, {
    mode = "n",
    "<leader>df",
    "<cmd>DiffviewFileHistory %<CR>",
    desc = "ファイルの変更履歴"
  }, {
    mode = "n",
    "<leader>dc",
    "<cmd>DiffviewClose<CR>",
    desc = "diffの画面閉じる"
  }, {
    mode = "n",
    "<leader>dd",
    "<cmd>Diffview<CR>",
    desc = "コンフリクト解消画面表示"
  }}
}}
