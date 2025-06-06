return {{
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup()
  end
}, {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {"williamboman/mason.nvim", "neovim/nvim-lspconfig"},
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {"clangd", "pyright", "marksman", "lua_ls", "cmake"},
      automatic_installation = true
    })

  end
}, {
  "jay-babu/mason-null-ls.nvim",
  config = function()
    require("mason-null-ls").setup({
      ensure_installed = {"clang-format", "black", "isort", "flake8", "prettier", "ruff", "cmakelint", "checkmake",
                          "cmakelang", "cpplint", "stylua"},
      automatic_installation = true
    })
  end
}}
