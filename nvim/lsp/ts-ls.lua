return {
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = {
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'vue',
        'astro',
    },
    root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' },
    init_options = {
        plugins = {
            {
                name = '@vue/typescript-plugin',
                location = vim.fn.stdpath('data')
                    .. '/mason/packages/vue-language-server/node_modules/@vue/language-server',
                languages = { 'vue' },
            },
        },
    },
    settings = {
        typescript = {
            -- Remove tsdk setting to allow auto-detection
            tsserver = {
                useSyntaxServer = false,
            },
            inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            },
        },
        javascript = {
            -- Remove tsdk setting to allow auto-detection
        },
    },
}
