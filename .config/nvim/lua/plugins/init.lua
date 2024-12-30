return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = require "configs.treesitter",
  },
  {
    "hrsh7th/nvim-cmp",
    config = require "configs.cmp",
  },
  {
    "supermaven-inc/supermaven-nvim",
    event = "BufReadPost",
    config = function()
      require("supermaven-nvim").setup {
        disable_keymaps = false,
        disable_inline_completion = false,
        keymaps = {
          accept_suggestion = "<S-Tab>",
          clear_suggestion = "<Nop>",
          accept_word = "<Nop>",
        },
      }
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
}
