local opt = vim.opt

-- Basic settings
opt.number = true -- Line numbers
opt.relativenumber = true -- Relative line numbers
opt.cursorline = true -- Highlight current line
opt.scrolloff = 10 -- Keep 10 lines above/below cursor
opt.sidescrolloff = 8 -- Keep 8 columns left/right of cursor
opt.wrap = false -- Don't wrap lines
opt.cmdheight = 1 -- Command line height

-- Tab / Indentation
opt.tabstop = 2 -- Tab width
opt.shiftwidth = 2 -- Indent width
opt.softtabstop = 2 -- Soft tab stop
opt.expandtab = true -- Use spaces instead of tabs
opt.smartindent = true -- Smart auto-indenting
opt.autoindent = true -- Copy indent from current line
opt.grepprg = "rg --vimgrep" -- Use ripgrep if available
opt.grepformat = "%f:%l:%c:%m" -- filename, line number, column, content

-- Search Settings
opt.ignorecase = true -- Case-insensitive search
opt.smartcase = true -- Case-sensitive if uppercase in search
opt.hlsearch = false -- Don't highlight search results
opt.incsearch = true -- Show matches as you type

-- Appearance
opt.termguicolors = true -- Enable 24-bit colors
opt.colorcolumn = "80" -- Show column at 80 characters
opt.signcolumn = "yes" -- Always show sign column
opt.completeopt = "menuone,noinsert,noselect" -- Completion options
opt.showmatch = true -- Highlight matching brackets
opt.matchtime = 2 -- How long to show matching bracket
opt.showmode = false -- Don't show mode in command line
opt.pumheight = 10 -- Popup menu height
opt.pumblend = 10 -- Popup menu transparency
opt.winblend = 0 -- Floating window transparency
opt.conceallevel = 0 -- Don't hide markup
opt.concealcursor = "" -- Show markup even on cursor line
opt.redrawtime = 10000 -- Timeout for syntax highlighting redraw
opt.maxmempattern = 20000 -- Max memory for pattern matching
opt.synmaxcol = 300 -- Syntax highlighting column limit

-- Behavior Settings
opt.hidden = true
opt.errorbells = false -- Disable error sounds
opt.backspace = "indent,eol,start" -- Make backspace behave naturally
opt.autochdir = false -- Don't change directory automatically
opt.iskeyword:append("-") -- Treat dash as part of a word
opt.path:append("**") -- Search into subfolders with `gf`
opt.selection = "inclusive" -- Use inclusive selection
opt.mouse = "a" -- Enable mouse support
opt.clipboard:append("unnamedplus") -- Use system clipboard
opt.modifiable = true -- Allow editing buffers
opt.encoding = "UTF-8" -- Use UTF-8 encoding
opt.wildmenu = true -- Enable command-line completion menu
opt.wildmode = "longest:full,full" -- Completion mode for command-line
opt.wildignorecase = true -- Case-insensitive tab completion in commands

-- File Handling
opt.backup = false -- Don't create backup files
opt.writebackup = false -- Don't backup before overwriting
opt.swapfile = false -- Don't create swap files
opt.undofile = true -- Persistent undo
opt.updatetime = 300 -- Time in ms to trigger CursorHold
opt.timeoutlen = 500 -- Time in ms to wait for mapped sequence
opt.ttimeoutlen = 0 -- No wait for key code sequences
opt.autoread = true -- Auto-reload file if changed outside
opt.autowrite = false -- Don't auto-save on some events
opt.diffopt:append("vertical") -- Vertical diff splits
opt.diffopt:append("algorithm:patience") -- Better diff algorithm
opt.diffopt:append("linematch:60") -- Better diff highlighting (smart line matching)

-- Set undo directory and ensure it exists
local undodir = "~/.cache/vim/undodir" -- Undo directory path
opt.undodir = vim.fn.expand(undodir) -- Expand to full path
local undodir_path = vim.fn.expand(undodir)
if vim.fn.isdirectory(undodir_path) == 0 then
	vim.fn.mkdir(undodir_path, "p") -- Create if not exists
end

-- Folding settings
opt.foldmethod = "expr" -- Use expression for folding
opt.foldexpr = "v:lua.treesitter.foldexpr()" -- Use treesitter for folding
opt.foldlevel = 99 -- Keep all folds open by default

-- Cursor settings
opt.guicursor = {
	"n-v-c:block", -- Normal, Visual, Command-line
	"i-ci-ve:block", -- Insert, Command-line Insert, Visual-exclusive
	"r-cr:hor20", -- Replace, Command-line Replace
	"o:hor50", -- Operator-pending
	"a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor", -- All modes: blinking & highlight groups
	"sm:block-blinkwait175-blinkoff150-blinkon175", -- Showmatch mode
}

-- Split behavior
opt.splitbelow = true -- Horizontal splits open below
opt.splitright = true -- Vertical splits open to the right
