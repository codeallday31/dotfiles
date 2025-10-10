return {
    cmd = { 'astro-ls', '--stdio' },
    filetypes = { 'astro' },
    init_options = {
        typescript = {
            tsdk = vim.fn.stdpath('data') .. '/mason/packages/typescript-language-server/node_modules/typescript/lib',
        },
    },
    root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
}
