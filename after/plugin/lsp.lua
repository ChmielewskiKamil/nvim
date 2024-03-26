local lsp_zero = require('lsp-zero').preset({ "recommended" })
require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'tsserver',
        'eslint',
        'rust_analyzer',
        'cairo_ls',
        'gopls',
        'html',
        'templ',
        'htmx',
        'tailwindcss',
    },
    handlers = {
        lsp_zero.default_setup,
    }
})

require('lspconfig').gopls.setup {
    filetypes = { "go", "gomod", "gowork", "gotmpl", "gohtml", "tmpl" },
    settings = {
        gopls = {
            templateExtensions = { "gohtml", "tmpl" },
            analyses = {
                unreachable = true,
                unusedparams = true
            }
        }
    }
}

require('lspconfig').emmet_language_server.setup {
    filetypes = { "html", "css", "javascript", "templ" },
}

require('lspconfig').html.setup {
    filetypes = { "html", "templ" },
}

require('lspconfig').htmx.setup {
    filetypes = { "html", "templ" },
}

require('lspconfig').tailwindcss.setup({
    filetypes = { "templ", "astro", "javascript", "typescript", "react", "html" },
    init_options = { userLanguages = { templ = "html" } },
})

lsp_zero.use('solidity', {
    cmd = { 'nomicfoundation-solidity-language-server', '--stdio' },
    filetypes = { 'solidity' },
    root_dir = require("lspconfig.util").root_pattern("hardhat.config.js", "hardhat.config.ts", "foundry.toml",
        "remappings.txt", "truffle.js", "truffle-config.js", "ape-config.yaml", ".git", "package.json"),
    single_file_support = true,
})

require('lspconfig').cairo_ls.setup({
    cmd = { 'scarb', 'cairo-language-server' },
})

lsp_zero.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['tsserver'] = {'javascript', 'typescript'},
    ['rust_analyzer'] = {'rust'},
    ['gopls'] = {'go'},
    ['html'] = {'html'},
    ['templ'] = {'templ'},
  }
})

-- Fix Undefined global 'vim'
lsp_zero.nvim_workspace()

-- Autocompletion settings
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp_zero.defaults.cmp_mappings({
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp_zero.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp_zero.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp_zero.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("v", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp_zero.setup()

vim.diagnostic.config({
    virtual_text = true
})
