vim.pack.add({
	{ src = 'https://github.com/catppuccin/nvim', name = 'catppuccin', priority = 1000 },
	'https://github.com/nvim-treesitter/nvim-treesitter',
})

require("config.options")
require("config.keymaps")
