local builtin = require('telescope.builtin')
-- search project files
vim.keymap.set('n', '<leader>ff', function()
	builtin.find_files({desc="Search files"})
end)
-- search git files 
vim.keymap.set('n', '<leader>fg', function()
	builtin.git_files({desc="Search git files"})
end)
-- search words 
vim.keymap.set('n', '<leader>fw', function()
	builtin.live_grep({desc="Search words"})
end)

