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

-- Code folding
vim.opt.foldmethod = "indent"
vim.opt.foldnestmax = 2
vim.opt.foldtext = "."

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
vim.opt.colorcolumn = "80,120"

-- Actual break at 80 chars for markdown files
vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = { '*.md' },
  callback = function()
    vim.opt.textwidth = 80
  end,
})

-- Hide command line unless needed 
vim.opt.cmdheight = 0

-- Insert comment leader on new line via <CR> or o
vim.opt.formatoptions = "jcroql"

-- Graphviz default output format
vim.g.graphviz_output_format = "png"

-- Markdown Preview
vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 0
vim.g.mkdp_combine_preview = 1

vim.filetype.add({ extension = { templ = "templ" } })
vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*.templ" }, callback = vim.lsp.buf.format })

vim.filetype.add({ extension = { noir = "nr" } })
