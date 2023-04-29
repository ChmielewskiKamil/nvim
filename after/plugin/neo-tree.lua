local setup, neotree = pcall(require, "neo-tree")
if not setup then
    return
end

neotree.setup({
    window = {
        width = 40,
        position = "left",
    }
})

vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>")
