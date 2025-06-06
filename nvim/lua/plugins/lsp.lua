return {{
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")

    -- LSPサーバーの設定
    lspconfig.clangd.setup({})
    lspconfig.pyright.setup({})
    lspconfig.marksman.setup({})
    lspconfig.lua_ls.setup({})
    lspconfig.cmake.setup({})

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
    
    local function on_attach(client, bufnr)
      print("LSP attached: " .. client.name)
    end

    lspconfig.clangd.setup({
      on_attach = on_attach,
      capabilities = capabilities
    })
      
    -- カーソルホバーの反応速度を上げる
    vim.opt.updatetime = 300
  end
}}
