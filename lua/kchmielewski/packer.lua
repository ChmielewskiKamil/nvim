local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Fuzzy finder
    use { 'nvim-telescope/telescope-fzf-native.nvim', { run = 'make' } }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Color scheme
    use { "bluz71/vim-nightfly-colors", as = "nightfly" }

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } }

    -- Treesitter playground
    use { 'nvim-treesitter/playground' }

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

    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    -- Vim surround
    -- Examples are great: https://github.com/tpope/vim-surround
    use { 'tpope/vim-surround' }

    -- Commenting
    use { 'numToStr/Comment.nvim' }

    -- Icons
    use { 'nvim-tree/nvim-web-devicons', tag = "nerd-v2-compat" }

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
    use { 'ggandor/leap.nvim' }

    -- Open line in GitHub
    use { 'ruanyl/vim-gh-line' }

    -- Pretty Diagnostics LSP lines
    use { 'https://git.sr.ht/~whynothugo/lsp_lines.nvim' }

    -- Copilot
    use { 'github/copilot.vim' }

    -- Graphviz compile & preview
    use { 'liuchengxu/graphviz.vim' }

    -- PlantUML
    use { 'aklt/plantuml-syntax' }

    -- Open Browser for PlantUML
    use { 'tyru/open-browser.vim' }

    -- PlantUML Previewer
    use { 'weirongxu/plantuml-previewer.vim' }

    -- Linting
    use { 'mfussenegger/nvim-lint' }

    -- Activity Watcher
    use { 'ActivityWatch/aw-watcher-vim' }

    -- Debugger
    use { 'mfussenegger/nvim-dap' }

    -- Debugger (support for Go's Delve debugger)
    use { 'leoluz/nvim-dap-go',
        ft = "go", dependencies = "mfussenegger/nvim-dap",
        config = function()
            require("dap-go").setup()
        end
    }

    use { 'rcarriga/nvim-dap-ui',
        requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        config = function()
            require("dapui").setup()
        end,

    }

    use { 'theHamsta/nvim-dap-virtual-text',
        config = function()
            require("nvim-dap-virtual-text").setup()
        end
    }
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
