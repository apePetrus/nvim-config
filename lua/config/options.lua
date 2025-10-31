vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.autoformat = false
vim.g.lazyvim_php_lsp = "intelephense"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.eol = false
vim.opt.fixendofline = false

vim.opt.expandtab = false

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "php", "inc" },
  callback = function()
    vim.opt_local.expandtab = true
  end,
})
