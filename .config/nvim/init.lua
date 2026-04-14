--
-- noncomplete's neovim config --
--
-- TODO:
-- Add things for C, Rust, Fortran

if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here
		vim.o.guifont = "ZedMono Nerd Font:h11"

    vim.g.neovide_padding_top = 2
    vim.g.neovide_padding_bottom = 2
    vim.g.neovide_padding_right = 2
    vim.g.neovide_padding_left = 2

    vim.g.neovide_opacity = 0.9
    vim.g.neovide_normal_opacity = 0.9
end


-- Bootstrap lazy.nvim --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

------ Options -------
vim.cmd([[set nrformats+=alpha]])
vim.cmd([[set title]])
vim.opt.winborder = "rounded"
vim.opt.showmode = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.showtabline = 2
vim.opt.signcolumn = "no"
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
--vim.opt.spell = true
vim.opt.spelllang = "en"

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

------ Plugins -------
require("lazy").setup({
  spec = {
    { 'nvim-mini/mini.nvim', version = '*' },

		{ 'nvim-treesitter/nvim-treesitter', lazy = false, build = ':TSUpdate' },
		{
			'nvim-telescope/telescope.nvim', tag = 'v0.2.0',
			dependencies = { 'nvim-lua/plenary.nvim' }
		},
		{ 'nvim-telescope/telescope-fzf-native.nvim'},
		{ 'nvim-tree/nvim-tree.lua' },
		{
  		"lervag/vimtex",
  		lazy = false,     -- we don't want to lazy load VimTeX
			-- tag = "v2.15", -- uncomment to pin to a specific release
  		init = function()
    		-- VimTeX configuration goes here, e.g.
				vim.g.vimtex_view_method = "zathura"
  		end
		},
		{
  		"folke/which-key.nvim",
  		event = "VeryLazy",
  		opts = {
  		  -- your configuration comes here
  		  -- or leave it empty to use the default settings
  		  -- refer to the configuration section below
  		},
  		keys = {
  		  {
  		    "<leader><leader>",
  		    function()
  		      require("which-key").show({ global = false })
  		    end,
  		    desc = "Buffer Local Keymaps (which-key)",
  		  },
  		},
		},
		{
      "folke/trouble.nvim",
      opts = {}, -- for default options, refer to the configuration section for custom setup.
      cmd = "Trouble",
      keys = {
        {
          "<leader>xx",
          "<cmd>Trouble diagnostics toggle<cr>",
          desc = "Diagnostics (Trouble)",
        },
        {
          "<leader>xX",
          "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
          desc = "Buffer Diagnostics (Trouble)",
        },
        {
          "<leader>cs",
          "<cmd>Trouble symbols toggle focus=false<cr>",
          desc = "Symbols (Trouble)",
        },
        {
          "<leader>cl",
          "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
          desc = "LSP Definitions / references / ... (Trouble)",
        },
        {
          "<leader>xL",
          "<cmd>Trouble loclist toggle<cr>",
          desc = "Location List (Trouble)",
        },
        {
          "<leader>xQ",
          "<cmd>Trouble qflist toggle<cr>",
          desc = "Quickfix List (Trouble)",
        },
    	},
			{
				'stevearc/oil.nvim',
  			---@module 'oil'
  			---@type oil.SetupOpts
  			opts = {},
  			dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  			lazy = false,
			},
			{
    		'windwp/nvim-autopairs',
    		event = "InsertEnter",
    		config = true
    		-- use opts = {} for passing setup options
    		-- this is equivalent to setup({}) function
			},
			{
			  "folke/zen-mode.nvim",
			  opts = {
			    -- your configuration comes here
			    -- or leave it empty to use the default settings
			    -- refer to the configuration section below
			  }
			},
			{ 'akinsho/toggleterm.nvim', version = "*", config = true },
			{
  			'chomosuke/typst-preview.nvim',
  			lazy = false, -- or ft = 'typst'
  			version = '1.*',
  			opts = {}, -- lazy.nvim will implicitly calls `setup {}`
			},
			{
    		"iamcco/markdown-preview.nvim",
    		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    		ft = { "markdown" },
    		build = function() vim.fn["mkdp#util#install"]() end,
			},
			{ 'JuliaEditorSupport/julia-vim', lazy = true},
			{'justinmk/vim-sneak', lazy=false}, --s<char1><char2> to jump
			{'ya2s/nvim-cursorline', lazy=false},
			--colorschemes
			--{'vague-theme/vague.nvim', lazy = false},
			{
  			"oskarnurm/koda.nvim",
  			lazy = false, -- make sure we load this during startup if it is your main colorscheme
  			priority = 1000, -- make sure to load this before all the other start plugins
  			config = function()
    			-- require("koda").setup({ transparent = true })
    			vim.cmd("colorscheme koda-dark")
  			end,
			},
			--{'Abstract-IDE/Abstract-cs', lazy = false},
			--{'mellow-theme/mellow.nvim', lazy = false},
			--{
    	--	'barrientosvctor/abyss.nvim',
    	--	lazy = false,
    	--	priority = 1000,
    	--	opts = {}
			--}
		},
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "koda-dark" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'rust', 'julia', 'python', 'c', 'cpp', 'bash', 'bibtex', 'css', 'fish', 'html', 'latex', 'lua', 'typst', 'markdown', 'json'},
	callback = function() vim.treesitter.start() end,
})

require("nvim-tree").setup()

require("toggleterm").setup{}

require('nvim-cursorline').setup {
  cursorline = {
    enable = true,
    timeout = 1000,
    number = false,
  },
  cursorword = {
    enable = true,
    min_length = 3,
    hl = { underline = true },
  }
}

--mini.nvim
require('mini.starter').setup({
	header=" █▄ █ █▀█ █▄ █ █▀▀ █▀█ █▀▄▀█ █▀█ █   █▀▀ ▀█▀ █▀▀\n █ ▀█ █▄█ █ ▀█ █▄▄ █▄█ █ ▀ █ █▀▀ █▄▄ ██▄  █  ██▄\n"
})
require('mini.icons').setup()
--require('mini.colors').setup({})
require('mini.indentscope').setup()
require('mini.git').setup()
require('mini.diff').setup()
require('mini.statusline').setup()
require('mini.tabline').setup()
require('mini.trailspace').setup()

--vim.cmd.colorscheme('miniwinter')
--MiniColors.get_colorscheme():add_transparency():apply()

-- Lualine
--require('lualine').setup {
--	options = {
--		theme = 'auto',
--		section_separators = '',
--		component_separators = '',
--		tabline = {
--  		lualine_a = {'buffers'},
--  		lualine_b = {'branch'},
--  		lualine_c = {'filename'},
--  		lualine_x = {},
--  		lualine_y = {},
--  		lualine_z = {'tabs'}
--		}
--	}
--}
--
require("oil").setup() --file manipulation like a normal buffer

------ Keymaps -------
local map = vim.keymap.set

map('n', '<leader>w', ':set wrap<CR>')
map('n', '<leader>W', ':set nowrap<CR>')
map('n', '<leader>z', ':ZenMode<CR>')
map('n', '<leader>f', ':NvimTreeToggle<CR>')
map('n', '<leader>T', ':TypstPreviewToggle<CR>')
map('n', '<leader>s', ':setlocal spell<CR>')
map('n', '<leader>S', ':setlocal nospell<CR>')
map('n', '<leader>th', ':ToggleTerm direction=horizontal name=hterm<CR>', { desc = 'New Horizontal Terminal' })
map('n', '<leader>tv', ':ToggleTerm direction=vertical name=vterm<CR>', { desc = 'New Vertical Terminal' })
map('n', '<leader>tt', ':ToggleTermSendVisualSelection<CR>', { desc = 'Send selected to Terminal' })
map({ "n", "x" }, "<leader>y", '"+y')
map({ "n", "x" }, "<leader>d", '"+d')
map({ "n", "t" }, "<Leader>o", "<Cmd>tabnew<CR>")
map({ "n", "t" }, "<Leader>x", "<Cmd>tabclose<CR>")
map({ "v", "x", "n" }, "<C-y>", '"+y', { desc = "System clipboard yank." })
