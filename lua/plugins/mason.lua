return
    {
        'neovim/nvim-lspconfig',
        --cmd = { 'LspInfo', 'LspLog', 'LspRestart', 'LspStart', 'LspStop' },

        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/nvim-cmp',
            'j-hui/fidget.nvim',
        },

        config = function()
            local cmp = require('cmp')
            local cmp_lsp = require('cmp_nvim_lsp')
            local capabilities = vim.tbl_deep_extend(
                'force',
                {},
                vim.lsp.protocol.make_client_capabilities(),
                cmp_lsp.default_capabilities())

            require('fidget').setup({})

            vim.lsp.config('*', {
                capabilities = capabilities
            })
            vim.lsp.config('lua_ls', {
                settings = {
                    Lua = {
                        runtime = { version = 'Lua 5.1' },
                        diagnostics = {
                            globals = { 'bit', 'vim', 'it', 'describe', 'before_each', 'after_each' },
                        },
                    },
                },
            })
            vim.lsp.config('clangd', {
                root_markers = { '.clang-format', 'compile_commands.json' },
            })
            vim.lsp.config('vtsls', {
                init_options = {
                    plugins = {
                        {
                            name = '@vue/typescript-plugin',
                            location = vim.fn.expand("$MASON/packages/vue-language-server/node_modules/@vue/language-server"),
                            languages = { 'vue' },
                        },
                    },
                },
                filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'svelte' },
            })

            require('mason').setup()
            require('mason-lspconfig').setup({
                ensure_installed = {
                    'lua_ls',
                    'tailwindcss',
                    'vue_ls',
                    'vtsls',
                }
            })

            local cmp_select = { behavior = cmp.SelectBehavior.Select }

            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-Space>'] = cmp.mapping.complete(),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                }, {
                        { name = 'buffer' },
                    })
            })

            vim.diagnostic.config({
                virtual_text = true,
                update_in_insert = true,
                float = {
                    focusable = true,
                    style = 'minimal',
                    border = 'rounded',
                    source = 'always',
                    header = '',
                    prefix = '',
                },
            })
            vim.keymap.set('n', '<leader>da', vim.lsp.buf.code_action, { noremap = true, silent = true, desc = "LSP Code Action" })
            vim.keymap.set('v', '<leader>da', vim.lsp.buf.code_action, { noremap = true, silent = true, desc = "LSP Code Action" })
        end
    }