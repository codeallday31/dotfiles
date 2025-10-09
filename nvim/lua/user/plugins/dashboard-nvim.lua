return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        require('dashboard').setup({
            theme = 'doom',
            config = {
                header = {
                    '                                                                                           ',
                    '                                                                                           ',
                    '                                                                                           ',
                    '                                                                                           ',
                    '                                                                                           ',
                    '                                                                                           ',
                    '     ██╗     ██╗██╗   ██╗███████╗    ████████╗██╗  ██╗███████╗    ██╗     ██╗███████╗███████╗  ',
                    '     ██║     ██║██║   ██║██╔════╝    ╚══██╔══╝██║  ██║██╔════╝    ██║     ██║██╔════╝██╔════╝  ',
                    '     ██║     ██║██║   ██║█████╗         ██║   ███████║█████╗      ██║     ██║█████╗  █████╗    ',
                    '     ██║     ██║╚██╗ ██╔╝██╔══╝         ██║   ██╔══██║██╔══╝      ██║     ██║██╔══╝  ██╔══╝    ',
                    '     ███████╗██║ ╚████╔╝ ███████╗       ██║   ██║  ██║███████╗    ███████╗██║██║     ███████╗  ',
                    '     ╚══════╝╚═╝  ╚═══╝  ╚══════╝       ╚═╝   ╚═╝  ╚═╝╚══════╝    ╚══════╝╚═╝╚═╝     ╚══════╝  ',
                    '                                                                                           ',
                    '            ██╗   ██╗ ██████╗ ██╗   ██╗    ██╗      ██████╗ ██╗   ██╗███████╗              ',
                    '            ╚██╗ ██╔╝██╔═══██╗██║   ██║    ██║     ██╔═══██╗██║   ██║██╔════╝              ',
                    '             ╚████╔╝ ██║   ██║██║   ██║    ██║     ██║   ██║██║   ██║█████╗                ',
                    '              ╚██╔╝  ██║   ██║██║   ██║    ██║     ██║   ██║╚██╗ ██╔╝██╔═                  ',
                    '               ██║   ╚██████╔╝╚██████╔╝    ███████╗╚██████╔╝ ╚████╔╝ ███████╗              ',
                    '               ╚═╝    ╚═════╝  ╚═════╝     ╚══════╝ ╚═════╝   ╚═══╝  ╚══════╝              ',
                    '                                                                                           ',
                    '                                                                                           ',
                },
                center = {
                    {
                        action = 'lua require("telescope.builtin").find_files()',
                        desc = ' Find File',
                        icon = ' ',
                        key = 'f',
                    },
                    { action = 'ene | startinsert', desc = ' New File', icon = ' ', key = 'n' },
                    {
                        action = 'lua require("telescope.builtin").oldfiles()',
                        desc = ' Recent Files',
                        icon = ' ',
                        key = 'r',
                    },
                    {
                        action = 'lua require("telescope.builtin").live_grep()',
                        desc = ' Find Text',
                        icon = ' ',
                        key = 'g',
                    },
                    { action = 'Lazy', desc = ' Lazy', icon = '󰒲 ', key = 'l' },
                    {
                        action = function()
                            vim.api.nvim_input('<cmd>qa<cr>')
                        end,
                        desc = ' Quit',
                        icon = ' ',
                        key = 'q',
                    },
                },
                footer = function()
                    local stats = require('lazy').stats()
                    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                    return { '⚡ Neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms' }
                end,
            },
        })
    end,
}
