return {
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'master',
        lazy = false,
        build = ':TSUpdate',
        dependencies = {
            'JoosepAlviste/nvim-ts-context-commentstring',
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = {
                    'lua',
                    'vim',
                    -- 'query',
                    'typescript',
                    'javascript',
                    'php',
                    'ruby',
                    'json',
                    'html',
                    'css',
                    'xml',
                    'yaml',
                    'vue',
                    -- 'go',
                    'astro',
                },

                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true,
                    disable = { 'yaml' },
                },
                rainbow = {
                    enable = true,
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ['if'] = '@function.inner',
                            ['af'] = '@function.outer',
                            ['ia'] = '@parameter.inner',
                            ['aa'] = '@parameter.outer',
                        },
                    },
                },
            })
        end,
    },
}
