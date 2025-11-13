return {
    'neovim/nvim-lspconfig',
    dependencies = {
        {
            'williamboman/mason.nvim',
            opts = {
                ui = {
                    icons = {
                        package_installed = '✓',
                        package_pending = '➜',
                        package_uninstalled = '✗',
                    },
                }
            },
        },
        {
            'j-hui/fidget.nvim',
            opts = {
                notification = {
                    override_vim_notify = true,
                    window = {
                        winblend = 0,
                        align = "top"
                    }
                },
            },
        },
    },
    config = function()
        vim.lsp.enable({
            'lua_ls',
            'tailwindcss',
            'ts_ls',
            'intelephense',
            'cssls',
            'astro',
            'twiggy_language_server',
            'ruby_lsp',
            'vue_ls',
            'docker_language_server',
        })

        vim.diagnostic.config({
            virtual_text = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
            float = {
                border = 'rounded',
                source = true,
            },
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = ' ',
                    [vim.diagnostic.severity.WARN] = ' ',
                    [vim.diagnostic.severity.INFO] = ' ',
                    [vim.diagnostic.severity.HINT] = ' ',
                },
                numhl = {
                    [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
                    [vim.diagnostic.severity.WARN] = 'WarningMsg',
                },
            },
        })
    end,
}
