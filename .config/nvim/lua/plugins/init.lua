return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
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
    "jpalardy/vim-slime",
    lazy = false,
    init = function()
      -- these two should be set before the plugin loads
      vim.g.slime_target = "neovim"
      vim.g.slime_no_mappings = true
    end,
    config = function()
      vim.g.slime_input_pid = false
      vim.g.slime_suggest_default = true
      vim.g.slime_menu_config = 1
      vim.g.slime_neovim_ignore_unlisted = false
      vim.g.slime_cell_delimiter = "#%%"
      -- options not set here are g:slime_neovim_menu_order, g:slime_neovim_menu_delimiter, and g:slime_get_jobid
      -- see the documentation above to learn about those options

      -- called MotionSend but works with textobjects as well
      vim.keymap.set("n", "gz", "<Plug>SlimeMotionSend", { remap = true, silent = false })
      vim.keymap.set("n", "gzz", "<Plug>SlimeSendCell", { remap = true, silent = false })
      vim.keymap.set("n", "gzl", "<Plug>SlimeLineSend", { remap = true, silent = false })
      vim.keymap.set("x", "gz", "<Plug>SlimeRegionSend", { remap = true, silent = false })
      vim.keymap.set("n", "gzc", "<Plug>SlimeConfig", { remap = true, silent = false })
    end,
  },

  {
    "JuliaEditorSupport/julia-vim",
    lazy = false,
    config = function()
      vim.g.latex_to_unicode_auto = 1
    end
  }
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
