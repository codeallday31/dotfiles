-- Status line

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup({
            options = {
                globalstatus = true,
                theme = 'palenight',
            },
            sections = {
                lualine_a = {
                    'mode',
                },
                lualine_b = {
                    'branch',
                    {
                        'diff',
                        symbols = { added = ' ', modified = ' ', removed = ' ' },
                    },
                    { 'diagnostics', sources = { 'nvim_diagnostic' } },
                },
                lualine_c = {
                    'filename'
                },
                lualine_x = {
                    {
                        require("lazy.status").updates,
                        cond = require("lazy.status").has_updates,
                        color = { fg = "#ff9e64" },
                    },
                },
                lualine_y = {
                    'filetype',
                    'encoding',
                    'fileformat',
                    '(vim.bo.expandtab and "␠ " or "⇥ ") .. vim.bo.shiftwidth',
                },
                lualine_z = {
                    'searchcount',
                    'selectioncount',
                    'location',
                    'progress',
                },
            },
        })
    end
}
