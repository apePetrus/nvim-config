return {
	"mason-org/mason.nvim",
	opts = {
		ensure_installed = {
			"intelephense",
		}
	},
	config = function()
		require('mason').setup(opts)
	end,
}