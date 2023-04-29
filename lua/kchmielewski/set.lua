-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Indentation & tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Line wrapping
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
-- The Undotree gets access to the long term version history
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Searching
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Appearance
vim.opt.termguicolors = true

-- Leave 8 lines to eol at all times
vim.opt.scrolloff = 8

-- Diagnostics
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
