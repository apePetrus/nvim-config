-- Bootstrap lazy.nvim
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

<<<<<<< HEAD
-- Setup lazy.nvim
=======
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

>>>>>>> d026fe47b394c9be05c2632c8aa1768b50a5b0ff
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
<<<<<<< HEAD
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "catppuccin" } },
  -- automatically check for plugin updates
=======
  install = { colorscheme = { "catppuccin" } },
>>>>>>> d026fe47b394c9be05c2632c8aa1768b50a5b0ff
  checker = { enabled = true },
})
