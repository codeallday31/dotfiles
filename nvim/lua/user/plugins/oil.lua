-- file explorer

return {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = {
        {
            'nvim-tree/nvim-web-devicons',
            opts = {},
        },
    },
    lazy = false,
    config = function()
        require('oil').setup({
            confirmation = {
                height = nil,
                border = 'rounded',
                win_options = {
                    winblend = 0,
                },
            },
        })

        vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

        -- Open parent directory in floating window
        vim.keymap.set('n', '<space>-', require('oil').toggle_float)
    end,
}
