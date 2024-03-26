-- Lazygit is configured inside the toggleterm.lua

vim.g.mapleader = " "

-- Enter netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move the highlighted text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Append line below to the current line, the cursor stays at the front
vim.keymap.set("n", "J", "mzJ`z")

-- Half-page jumps, cursos stays in the center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Search result stays in the center
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste over something, the thing that gets deleted goes to the void register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Leader + y or Y will paste into system clipboard
-- This means that you can quickly use two clipboards (vim and system)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete to void register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Disable recording macros lol
-- vim.keymap.set("n", "Q", "<nop>")

-- Lsp format text
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- QuickFix list prev/next
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- Locations list prev/next, locations list is populated by grep
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Search and replace current worder under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make executable, really usefull for bash scripts
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Open packer config file to quickly add new plugins
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/kchmielewski/packer.lua<CR>");

-- Shoutout
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- Improved Terminal Navigation
-- Instead of <C-w>h you can simply <C-h> to move to the left window
vim.keymap.set("n", "<C-h>", "<c-\\><c-n><c-w>h")
vim.keymap.set("n", "<C-j>", "<c-\\><c-n><c-w>j")
vim.keymap.set("n", "<C-k>", "<c-\\><c-n><c-w>k")
vim.keymap.set("n", "<C-l>", "<c-\\><c-n><c-w>l")

-- Telescope
-- search project files
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")

-- Search git files
vim.keymap.set('n', '<leader>fg', "<cmd>Telescope git_files<cr>")

-- Search words
vim.keymap.set('n', '<leader>fw', "<cmd>Telescope live_grep<cr>")

-- Search word under cursor
vim.keymap.set('n', '<leader>fc', "<cmd>Telescope grep_string<cr>")

-- Bufferline mappings
vim.keymap.set("n", "<S-l>", "<cmd>:BufferLineCycleNext<CR>", { silent = true })
vim.keymap.set("n", "<S-h>", "<cmd>:BufferLineCyclePrev<CR>", { silent = true })
vim.keymap.set("n", "<leader>c", "<cmd>:bdelete<CR>", { silent = true })
vim.keymap.set("n", "<leader>bp", "<cmd>:BufferLineTogglePin<CR>", { silent = true })

-- Copilot mappings
-- Tab works as well
vim.keymap.set("i", "<F1>", 'copilot#Accept("<CR>")', {silent = true, expr = true, replace_keycodes = false })

-- Preview currently open Graphviz file
vim.keymap.set("n", "<leader>gp", "<cmd>Graphviz!!<cr>")

-- Preview currently open PlantUML file as PNG
vim.keymap.set("n", "<leader>up", "<cmd>!plantuml % && open %:r.png<cr>", { silent = true })

-- Preview currently open PlantUML file as SVG
vim.keymap.set("n", "<leader>us", "<cmd>!plantuml % -Tsvg && open %:r.svg<cr>", { silent = true })
