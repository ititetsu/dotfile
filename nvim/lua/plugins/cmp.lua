return {
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")

      -- LSP capabilities に offsetEncoding を追加
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      capabilities.offsetEncoding = {"utf-8"}

      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<CR>"] = cmp.mapping.confirm({
            select = true
          })
        }),
        sources = {{
          name = "nvim_lsp"
        }, {
          name = "buffer"
        }, {
          name = "path"
        }}
      })

      -- グローバルに capabilities を使いたい場合は以下を定義しておくと便利
      vim.g.cmp_capabilities = capabilities
    end
  },
  {"hrsh7th/cmp-nvim-lsp"},
  {"hrsh7th/cmp-buffer"},
  {"hrsh7th/cmp-path"}
}
