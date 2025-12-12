-- basic setup
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.autoformat = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.eol = false
vim.opt.fixendofline = false

vim.opt.expandtab = false

-- general keymaps
vim.keymap.set('n', '<C-q>', ':bd<CR>', {})
vim.keymap.set('n', '<C-p>', ':let @+ = expand("%")<CR>', {})


-- plugins
vim.pack.add({
	'https://github.com/chentoast/marks.nvim',
	{ src = 'https://github.com/catppuccin/nvim', name = 'catppuccin', priority = 1000 },
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
	'https://github.com/mfussenegger/nvim-dap',
	'https://github.com/hrsh7th/nvim-cmp',
	'https://github.com/hrsh7th/cmp-nvim-lsp',

	'https://github.com/nvim-lua/plenary.nvim',
	{ src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	'https://github.com/nvim-telescope/telescope.nvim',

	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/mason-org/mason.nvim',
	'https://github.com/mason-org/mason-lspconfig.nvim',

	'https://github.com/nvimtools/none-ls.nvim',
	'https://github.com/jay-babu/mason-null-ls.nvim',
})

vim.cmd.colorscheme('catppuccin')

require('marks').setup({
	builtin_marks = { '<', '>', '^' },
})


-- telescope
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
local map  = vim.keymap.set

map('n', '<leader><space>', builtin.find_files)
map('n', '<leader>/',       builtin.live_grep)
map('n', '<leader>,',       builtin.buffers)
map('n', '<leader>gs',      builtin.git_status)
map('n', '<leader>gc',      builtin.git_commits)
map('n', '<leader>gf',      builtin.git_files)


-- treesitter
require('nvim-treesitter.configs').setup({
	ensure_installed = {
		'lua', 'php', 'javascript', 'typescript', 'markdown', 'sql', 'c'
	},
	highlight = { enabled = true },
	indent = { enabled = true },
})

vim.filetype.add({
	extension = {
		inc = 'php',
	},
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "php", "inc", "sql" },
	callback = function()
		vim.opt_local.expandtab = true
	end,
})

-- mason
require('mason').setup()
require('mason-lspconfig').setup({
	ensure_installed = {
		'intelephense', 'eslint', 'ts_ls'
	},
})

require('mason-null-ls').setup({
	ensure_installed = {
		'php-cs-fixer', 'prettier', 'eslint_d', 'phpcs'
	}
})


-- lspconfig
vim.lsp.start({
	name = 'intelephense',
	cmd = { 'intelephense', '--stdio' },
	root_dir = vim.fs.root(0, { 'composer.json', '.git' }),
	on_attach = function(client, buffer)
		local opts = { buffer = bufnr, silent = true }
		map("n", "gd",         vim.lsp.buf.definition, opts)
        map("n", "K",          vim.lsp.buf.hover, opts)
        map("n", "gr",         vim.lsp.buf.references, opts)
        map("n", "<leader>rn", vim.lsp.buf.rename, opts)
	end,
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
})
