-- auto-format on save
local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	group = lsp_fmt_group,
	callback = function()
		local efm = vim.lsp.get_active_clients({ name = "efm" })

		if vim.tbl_isempty(efm) then
			return
		end

		vim.lsp.buf.format({ name = "efm", async = true })
	end,
})

-- highlight on yank
local highlight_yank_group = vim.api.nvim_create_augroup("HighlightYankGroup", {})
vim.api.nvim_create_autocmd("TextYankPost", {
  group = highlight_yank_group,
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- disable comment continuation
local format_options_group = vim.api.nvim_create_augroup("FormatOptionsGroup", {})
vim.api.nvim_create_autocmd("BufEnter", {
  group = format_options_group,
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})
