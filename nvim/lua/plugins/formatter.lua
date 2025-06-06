return {{
  "nvimtools/none-ls.nvim",
  dependencies = {"williamboman/mason.nvim", "jay-babu/mason-null-ls.nvim"},

  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {null_ls.builtins.formatting.clang_format, null_ls.builtins.formatting.black,
                 null_ls.builtins.formatting.isort, null_ls.builtins.diagnostics.flake8},
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.keymap.set("n", "<leader>ft", function()
            vim.lsp.buf.format({
              bufnr = bufnr
            })
          end, {
            buffer = bufnr,
            desc = "Format file"
          })
        end
      end
    })
  end
}, {
  "danymat/neogen",
  config = true
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*" 
}}
