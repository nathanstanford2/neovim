local vue_plugin = {
    name = '@vue/typescript-plugin',
    location = vim.fn.stdpath('data') ..
        '/mason/packages/vue-language-server/node_modules/@vue/language-server',
    languages = { 'vue' },
    configNamespace = 'typescript',
    init_options = {
        preferences = {
            wrapAttributes = "force-expand-multiline",
        },
    },
    settings = {
        html = {
            format = {
                wrapAttributes = 'force-expand-multiline',
            },
        },
    },
}

vim.lsp.config('vtsls', {
    settings = {
        vtsls = {
            tsserver = {
                globalPlugins = {
                    vue_plugin,
                },
            },
        },
    },
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
})