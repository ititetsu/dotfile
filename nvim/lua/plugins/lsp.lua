return {{
  "neovim/nvim-lspconfig",
  dependencies = {
    "saghen/blink.cmp",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("blink.cmp").get_lsp_capabilities({
      textDocument = {
        completion = {
          completionItem = {
            snippetSupport = true,
          },
        },
        foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true,
        },
      },
    })
    -- カーソルホバー時に診断を表示
    vim.api.nvim_create_autocmd("CursorHold", {
      callback = function()
        vim.diagnostic.open_float(nil, {
          focusable = false,
          close_events = {"BufLeave", "CursorMoved", "InsertEnter", "FocusLost"},
          border = "rounded",
          source = "always",
          prefix = "",
          scope = "cursor"
        })
      end
    })

    -- カーソルホバーの反応速度を上げる
    vim.opt.updatetime = 300
  end
},
  -- Glance.nvim（LSP UI 強化）
  {
    "dnlhc/glance.nvim",
    config = function()
      require("glance").setup({
        height = 18,
        border = "rounded",
        theme = { enable = true, mode = "auto" },
        mappings = {
          list = {
            ["j"] = "next",
            ["k"] = "previous",
            ["<Esc>"] = "close",
          },
          preview = {
            ["q"] = "close",
            ["<Esc>"] = "close",
          },
        },
      })

      -- Glance 用キーマッピング
      vim.keymap.set("n", "gd", "<CMD>Glance definitions<CR>")
      vim.keymap.set("n", "grr", "<CMD>Glance references<CR>")
      vim.keymap.set("n", "gi", "<CMD>Glance implementations<CR>")
      vim.keymap.set("n", "gt", "<CMD>Glance type_definitions<CR>")
    end,
  },
  }
