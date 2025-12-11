vim.pack.add({
	{ src = 'https://github.com/catppuccin/nvim', name = 'catppuccin', priority = 1000 },
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/mason-org/mason.nvim',
	'https://github.com/mason-org/mason-lspconfig.nvim',
	'https://github.com/nvim-lua/plenary.nvim',
	{ src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	'https://github.com/nvim-telescope/telescope.nvim'
})

require("plugins.treesitter")
require('plugins.mason')

require("config.options")
require("config.keymaps")

local telescope = require('telescope')
telescope.setup({
	defaults = {
		path_displays = { 'smart' },
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = 'smart_case',
		},
	},
})
require('telescope').load_extension('fzf')

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader><space>', builtin.find_files)
vim.keymap.set('n', '<leader>/',       builtin.live_grep)
vim.keymap.set('n', '<leader>,',       builtin.buffers)

