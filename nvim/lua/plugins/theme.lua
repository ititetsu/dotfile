return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "frappe",
        styles = {
          comments = { "italic" },
          keywords = { "bold" },
          functions = { "italic", "bold" },
        },
        integrations = {
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          telescope = true,
          cmp = true,
          lsp_trouble = true,
          which_key = true,
        }
      })
      vim.cmd.colorscheme("catppuccin")
    end
  },
  { "folke/which-key.nvim" },
}
