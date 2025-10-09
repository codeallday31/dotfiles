-- Fuzzy finder

return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'nvim-telescope/telescope-live-grep-args.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
        local actions = require('telescope.actions')
        local builtin = require('telescope.builtin')
        require('telescope').setup({
            defaults = {
                path_display = { truncate = 1 },
                prompt_prefix = '   ',
                selection_caret = '  ',
                layout_config = {
                    prompt_position = 'top',
                },
                preview = {
                    filesize_limit = 1,
                    timeout = 200,
                    msg_bg_fillchar = ' ',
                },
                sorting_strategy = 'ascending',
                mappings = {
                    i = {
                        ['<esc>'] = actions.close,
                        ['<c-down>'] = actions.cycle_history_next,
                        ['<c-up>'] = actions.cycle_history_prev,
                    },
                },
                file_ignore_patterns = { '.git/' },
            },
            pickers = {
                find_files = {
                    hidden = true,
                },
                buffers = {
                    previewer = false,
                    layout_config = {
                        width = 80,
                    },
                },
                oldfiles = {
                    prompt_title = 'History',
                },
                lsp_references = {
                    previewer = false,
                },
                lsp_definitions = {
                    previewer = false,
                },
                lsp_document_symbols = {
                    symbol_width = 55,
                },
            },
            extensions = {
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown(),
                },
                live_grep_args = {
                    mappings = {
                        i = {
                            ['<C-k>'] = require('telescope-live-grep-args.actions').quote_prompt(),
                            ['<C-space>'] = actions.to_fuzzy_refine,
                        },
                    },
                },
                fzf = {
                    fuzzy = true, -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true, -- override the file sorter
                    case_mode = 'smart_case', -- "smart_case", "respect_case", "ignore_case"
                },
            },
        })

        vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>F', function()
            builtin.find_files({ no_ignore = true, prompt_title = 'All Files' })
        end, { desc = 'Telescope find files (all)' })
        vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>g', function()
            require('telescope').extensions.live_grep_args.live_grep_args({
                prompt_title = 'Grep Project',
                vimgrep_arguments = {
                    'rg',
                    '--hidden',
                    '-L',
                    '--color=never',
                    '--sort=path',
                    '--no-heading',
                    '--with-filename',
                    '--line-number',
                    '--column',
                    '--smart-case',
                },
            })
        end, { desc = 'Live grep project' })
        vim.keymap.set('n', '<leader>G', function()
            require('telescope').extensions.live_grep_args.live_grep_args({
                prompt_title = 'Grep All Files',
                vimgrep_arguments = {
                    'rg',
                    '--hidden',
                    '--no-ignore',
                    '-L',
                    '--color=never',
                    '--sort=path',
                    '--no-heading',
                    '--with-filename',
                    '--line-number',
                    '--column',
                    '--smart-case',
                },
            })
        end, { desc = 'Live grep all files' })

        vim.keymap.set('n', '<leader>h', builtin.help_tags, { desc = 'Telescope help tags' })

        vim.keymap.set('n', '<leader>s', builtin.lsp_document_symbols, { desc = 'Telescope LSP document symbols' })

        require('telescope').load_extension('fzf')
        require('telescope').load_extension('ui-select')
    end,
}
