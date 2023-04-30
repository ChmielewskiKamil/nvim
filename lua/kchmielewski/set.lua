-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Indentation & tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Line wrapping
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
-- The Undotree gets access to the long term version history
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Searching
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Appearance
vim.opt.termguicolors = true

-- Leave 8 lines to eol at all times
vim.opt.scrolloff = 8

-- Diagnostics
vim.opt.signcolumn = "yes"

-- Additional chars in filenames
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- Visual line at 80 chars
vim.opt.colorcolumn = "80"

-- Hide command line unless needed 
vim.opt.cmdheight = 0
