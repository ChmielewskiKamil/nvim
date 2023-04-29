local setup, neotree = pcall(require, "neo-tree")
if not setup then
    return
end

neotree.setup()

vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>")
