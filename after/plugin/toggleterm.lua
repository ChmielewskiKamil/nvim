local setup, toggleterm = pcall(require, "toggleterm")
if not setup then
    return
end

toggleterm.setup()

-- Lazygit setup commands
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua lazygit_toggle()<CR>", {noremap = true, silent = true})
