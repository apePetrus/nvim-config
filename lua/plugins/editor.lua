vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name = ev.data.spec.name
    
    if name == "nvim-treesitter" then
      vim.cmd("TSUpdate")
    
    elseif name == "telescope-fzf-native.nvim" then
      -- Run 'make' inside plugin's directory
      local plugin_path = ev.data.path
      vim.fn.jobstart({ "make" }, { cwd = plugin_path })
    end
  end,
})

vim.pack.add({
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },

	'https://github.com/nvim-lua/plenary.nvim',
	{ src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim' },
	'https://github.com/nvim-telescope/telescope.nvim',
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
