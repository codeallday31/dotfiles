return {
    {
        'stevearc/conform.nvim',
        opts = {
            format_on_save = {
                timeout_ms = 10000,
                lsp_format = 'fallback',
            },
            formatters_by_ft = {
                lua = { 'stylua' },
                javascript = { 'eslint_d', 'prettierd' },
                javascriptreact = { 'eslint_d', 'prettierd' },
                typescript = { 'eslint_d', 'prettierd' },
                typescriptreact = { 'eslint_d', 'prettierd' },
                graphql = { 'prettierd' },
                vue = { 'eslint_d', 'prettierd' },
                astro = { 'eslint_d', 'prettierd' },
                php = { 'php_cs_fixer', 'pint', stop_after_first = true },
                css = { 'prettierd' },
                -- sql = { "sql_formatter" },
                -- go = { "goimports", "gofmt" },
            },
        },
    },
}
