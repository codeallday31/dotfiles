--[[
    zM → close all folds
    zR → open all folds
    zc / zo / za → close/open/toggle fold under cursor
    K → peek folded lines
]]
return {
    {
        'kevinhwang91/nvim-ufo',
        dependencies = { 'kevinhwang91/promise-async' },
        config = function()
            require('ufo').setup({
                provider_selector = function()
                    return { 'lsp', 'indent' }
                end,
                preview = {
                    mappings = {
                        scrollU = '<C-u>',
                        scrollD = '<C-d>',
                        jumpTop = '[',
                        jumpBot = ']',
                    },
                },
            })

            vim.o.foldcolumn = '0' -- Shows fold indicators; '0' hides it
            vim.o.foldlevel = 99 -- Start with all folds open (high value needed)
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true

            vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = 'Open all folds' })
            vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = 'Close all folds' })
            vim.keymap.set('n', 'K', function()
                local winid = require('ufo').peekFoldedLinesUnderCursor()
                if not winid then
                    vim.lsp.buf.hover()
                end
            end, { desc = 'Peek fold or LSP hover' })
        end,
    },
}
