local map = vim.keymap.set
local builtin = require('telescope.builtin')

-- Buffer navigation
map('n', 'L', ':bn<CR>', { desc = 'Next buffer' })
map('n', 'H', ':bp<CR>', { desc = 'Previous buffer' })
map('n', '<C-q>', ':bd<CR>', { desc = 'Close buffer' })

-- Pane and window navigation + manipulation
map('n', '<C-c>', '<C-w>c', { desc = 'Close window' })
map('n', '<C-h>', '<C-w>h', { desc = 'Navigate left' })
map('n', '<C-j>', '<C-w>j', { desc = 'Navigate down' })
map('n', '<C-k>', '<C-w>k', { desc = 'Navigate up' })
map('n', '<C-l>', '<C-w>l', { desc = 'Navigate right' })
map('n', '<M-h>', ':vertical resize +2<CR>', { desc = 'Resize left' })
map('n', '<M-l>', ':vertical resize -2<CR>', { desc = 'Resize right' })
map('n', '<M-j>', ':resize -2<CR>', { desc = 'Resize down' })
map('n', '<M-k>', ':resize +2<CR>', { desc = 'Resize up' })
map("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
map("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })

-- Indent
map('v', '<', '<gv', { noremap = true, silent = true })
map('v', '>', '>gv', { noremap = true, silent = true })

-- Utils
map('n', '<C-p>', ':let @+ = expand("%")<CR>', { desc = 'Copy path/to/file name' })
map('n', '<leader>pa', ':echo expand("%:p")<CR>', { desc = 'Show full file-path' })

-- Telescope
map('n', '<leader><space>', builtin.find_files)
map('n', '<leader>/',       builtin.live_grep)
map('n', '<leader>,',       builtin.buffers)
map('n', '<leader>gs',      builtin.git_status)
map('n', '<leader>gc',      builtin.git_commits)
map('n', '<leader>gf',      builtin.git_files)
