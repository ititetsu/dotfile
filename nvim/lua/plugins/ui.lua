return { -- {
--   "nvim-tree/nvim-tree.lua",
--   dependencies = { "nvim-tree/nvim-web-devicons" },
--   keys = {
--     { mode = "n", "<C-n>", "<cmd>NvimTreeToggle<CR>", desc = "NvimTreeをトグルする" },
--     { mode = "n", "<C-m>", "<cmd>NvimTreeFocus<CR>", desc = "NvimTreeにフォーカス" },
--   },
--   config = function()
--     require("nvim-tree").setup {
--       git = { enable = true, ignore = false }
--     }
--   end
-- },
{
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {"nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", -- ファイルアイコン
  "MunifTanjim/nui.nvim" -- UIコンポーネント
  },
  keys = {{
    "<C-n>",
    "<cmd>Neotree toggle<CR>",
    desc = "Neo-tree をトグル"
  }, {
    "<C-m>",
    "<cmd>Neotree focus<CR>",
    desc = "Neo-tree にフォーカス"
  }},
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      enable_git_status = true,
      enable_diagnostics = true,
      window = {
        position = "left",
        width = 30,
        mappings = {
          ["<cr>"] = "open",
          ["s"] = "open_split",
          ["v"] = "open_vsplit",
          ["C"] = "close_node",
          ["R"] = "refresh"
        }
      },
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false
        }
      },
      default_component_configs = {
        name = {
          trailing_slash = false,
          use_git_status_colors = true,
          highlight = "NeoTreeFileName",
          padding = 0 -- ← これもズレの原因になることがあります
        },
        icon = {
          padding = "" -- ← スペースを完全になくす
        }

      }
    })
  end
}, {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {"nvim-tree/nvim-web-devicons"},
  keys = {{
    mode = "n",
    "<C-h>",
    "<cmd>bprev<CR>",
    desc = "Previous buffer"
  }, {
    mode = "n",
    "<C-l>",
    "<cmd>bnext<CR>",
    desc = "Next buffer"
  }},
  config = function()
    vim.opt.termguicolors = true
    require("bufferline").setup {
      options = {
        always_show_bufferline = true,
        mode = "buffers", -- or "tabs"
        numbers = "ordinal",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = (level:match("error") and " " or " ")
          return " " .. icon .. count
        end,
        show_buffer_close_icons = true,
        show_close_icon = false,
        separator_style = "slant", -- "slant" | "thick" | "thin" | { 'any', 'any' }
        offsets = {{
          filetype = "neo-tree",
          text = "File Explorer",
          highlight = "Directory",
          text_align = "left"
        }}
      }
    }
  end
}, {
  "moll/vim-bbye",
  keys = {{
    mode = "n",
    "<leader>c",
    "<cmd>Bdelete<CR>",
    desc = "バッファを閉じる"
  }}
}, {
  'lukas-reineke/indent-blankline.nvim',
  dependencies = {'HiPhish/rainbow-delimiters.nvim', 'nvim-treesitter/nvim-treesitter'},
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {"python", "typescript", "c"},
      highlight = {
        enable = true
      }
    })
    local highlight = {"RainbowRed", "RainbowYellow", "RainbowBlue", "RainbowOrange", "RainbowGreen", "RainbowViolet",
                       "RainbowCyan"}
    local hooks = require("ibl.hooks")
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed", {
        fg = "#E06C75"
      })
      vim.api.nvim_set_hl(0, "RainbowYellow", {
        fg = "#E5C07B"
      })
      vim.api.nvim_set_hl(0, "RainbowBlue", {
        fg = "#61AFEF"
      })
      vim.api.nvim_set_hl(0, "RainbowOrange", {
        fg = "#D19A66"
      })
      vim.api.nvim_set_hl(0, "RainbowGreen", {
        fg = "#98C379"
      })
      vim.api.nvim_set_hl(0, "RainbowViolet", {
        fg = "#C678DD"
      })
      vim.api.nvim_set_hl(0, "RainbowCyan", {
        fg = "#56B6C2"
      })
    end)
    vim.g.rainbow_delimiters = {
      highlight = highlight
    }
    require("ibl").setup {
      scope = {
        highlight = highlight
      }
    }

    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  end
}, {
  "nvim-tree/nvim-web-devicons",
  lazy = false,
  priority = 1000,
  config = function()
    require("nvim-web-devicons").setup({})
  end
}}
