-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Fuzzy finder
    use { 'nvim-telescope/telescope-fzf-native.nvim', { run = 'make' } }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Color scheme
    use { "bluz71/vim-nightfly-colors", as = "nightfly" }

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } }

    -- Treesitter playground
    use {'nvim-treesitter/playground'}

    -- Undotree
    use { 'mbbill/undotree' }

    -- LSP Zero
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }

    -- Vim surround
    -- Examples are great: https://github.com/tpope/vim-surround
    use { 'tpope/vim-surround' }

    -- Commenting
    use { 'numToStr/Comment.nvim' }

    -- File explorer
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }

    -- Toggleterm for Lazygit
    use { 'akinsho/toggleterm.nvim' }

    -- Status line - Lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- Buffer line - Bufferline
    use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }

    -- Autopairs
    use { 'windwp/nvim-autopairs' }

    -- Vim Leap
    use {'ggandor/leap.nvim'}

    -- Open line in GitHub
    use {'ruanyl/vim-gh-line'}

    -- Pretty Diagnostics LSP lines
    use {'https://git.sr.ht/~whynothugo/lsp_lines.nvim'}

    -- Copilot
    use {'github/copilot.vim'}
end)
