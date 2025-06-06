return {{
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup {
      direction = "float",
      open_mapping = [[<leader>tt]],
      float_opts = {
        border = "curved",
        winblend = 3,
        title_pos = "center"
      }
    }

    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      dir = "git_dir",
      hidden = true
    })
    function _lazygit_toggle()
      lazygit:toggle()
    end
    vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", {
      noremap = true,
      silent = true
    })
  end
}, {
  "ojroques/nvim-osc52",
  config = function()
    require("osc52").setup({
      max_length = 0,
      silent = false,
      trim = false,
      tmux_passthrough = true
    })

    local function copy()
      if vim.v.event.operator == "y" and vim.v.event.regname == "" then
        require("osc52").copy_register("")
      end
    end

    vim.api.nvim_create_autocmd("TextYankPost", {
      callback = copy
    })
  end
}, {
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  config = true
  -- use opts = {} for passing setup options
  -- this is equivalent to setup({}) function
}}
