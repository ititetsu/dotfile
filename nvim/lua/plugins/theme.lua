return {
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  --   config = function()
  --     require("catppuccin").setup({
  --       flavour = "frappe",
  --       styles = {
  --         comments = { "italic" },
  --         keywords = { "bold" },
  --         functions = { "italic", "bold" },
  --       },
  --       integrations = {
  --         gitsigns = true,
  --         nvimtree = true,
  --         treesitter = true,
  --         telescope = true,
  --         cmp = true,
  --         lsp_trouble = true,
  --         which_key = true,
  --       }
  --     })
  --     vim.cmd.colorscheme("catppuccin")
  --   end
  -- },
  -- {
  --   "Mofiqul/dracula.nvim",
  --   name = "dracula",
  --   priority = 1000,
  --   config = function()
  --   require("dracula").setup({
  --       styles = {
  --           comments = { "italic" },
  --               keywords = { "bold" },
  --               functions = { "italic", "bold" },
  --           },
  --           integrations = {
  --               gitsigns = true,
  --               nvimtree = true,
  --               treesitter = trueV,
  --               telescope = true,
  --               cmp = true,
  --               lsp_trouble = true,
  --               which_key = true,
  --           }
  --       })
  --       vim.cmd.colorscheme("dracula")
  --   end
  -- },
 {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- スタイル設定は setup より前に
    vim.g.tokyonight_style = "storm"
    vim.g.tokyonight_transparent = true
    vim.g.tokyonight_sidebars = { "qf", "help", "terminal", "packer", "nvim-tree", "telescope" }
    vim.g.tokyonight_style_comment = "italic"
    vim.g.tokyonight_style_keywords = "bold"
    vim.g.tokyonight_style_functions = "italic"
    vim.g.tokyonight_lualine_bold = true
    vim.o.background = "dark"

    -- テーマのセットアップ
    require("tokyonight").setup({})

    -- テーマ適用
    vim.cmd("colorscheme tokyonight-storm")

    -- 行・列ハイライト
    vim.o.cursorline = true
    vim.o.cursorcolumn = true

    -- ハイライト色（colorscheme の後に設定）
    -- vim.cmd [[
      -- "highlight CursorLine guibg=#1f2335
      -- highlight CursorColumn guibg=#1f2335
    -- ]]
  end,
},
-- plugins/colorizer.lua
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
      require("colorizer").setup({
        "*", -- すべてのファイルタイプで有効
        css = { rgb_fn = true },
        html = { names = true },
      }, {
        names = true,
        RRGGBBAA = true,
        rgb_fn = true,
        hsl_fn = true,
        mode = "background", -- "foreground" も選べる
      })
    end,
  },
 { "folke/which-key.nvim" },
}
