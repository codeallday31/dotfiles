local api = vim.api

api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(event)
        local opts = { buffer = event.buf, silent = true, noremap = true }
        -- stylua: ignore start
        local keymaps = {
            { "n", "gC",         vim.lsp.buf.outgoing_calls,  "Outgoing Calls" },
            { "n", "gD",         vim.lsp.buf.declaration,     "Goto Declaration" },
            { "n", "gI",         vim.lsp.buf.incoming_calls,  "Incoming Calls" },
            { "n", "gd",         vim.lsp.buf.definition,      "Goto Definition" },
            { "n", "gl",         vim.diagnostic.open_float,   "Floating Diagnostic" },
            { "n", "go",         vim.lsp.buf.type_definition, "Goto Type Definition" },
            { "n", "<leader>ca", vim.lsp.buf.code_action,     "Code Action" },
            { "n", "<leader>cr", vim.lsp.buf.rename,          "Rename Symbol" },
            -- { "n", "<leader>q",  vim.diagnostic.setloclist,   "Diagnostics List" },
            { "n", "gi",         ":Telescope lsp_implementations<CR>",  "Telescope LSP Implementations" },
            { "n", "gr",         ":Telescope lsp_references<CR>",       "Telescope LSP References" }
        }
        -- stylua: ignore end
        for _, map in ipairs(keymaps) do
            vim.keymap.set(map[1], map[2], map[3], vim.tbl_extend('force', opts, { desc = map[4] }))
        end

        -- local client = vim.lsp.get_client_by_id(event.data.client_id)
        -- if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
        --     vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
        --     vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
        --     vim.keymap.set('i', '<C-Space>', function()
        --         vim.lsp.completion.get()
        --     end)
        -- end
    end,
})
