return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        style = "night"
    },
    config = function (plugin, opts)
        require('tokyonight').setup(opts)

        vim.cmd[[colorscheme tokyonight]]
    end,
}
