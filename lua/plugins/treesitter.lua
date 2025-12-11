local configs = require('nvim-treesitter.configs')

configs.setup({
	ensure_installed = {
		'lua', 'php', 'javascript', 'typescript', 'markdown', 'sql', 'c'
	},
	highlight = { enabled = true },
	indent = { enabled = true },
})