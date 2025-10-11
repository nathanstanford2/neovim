return {
    'neovim/nvim-lspconfig',

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

        -- LSP capabilities for nvim-cmp completion
        local capabilities = vim.tbl_deep_extend(
            'force',
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        require('fidget').setup({})
        require('mason').setup()

        require('mason-lspconfig').setup({
            ensure_installed = {
                'lua_ls',
                'tailwindcss',
                'vue_ls',
                'vtsls',
                'intelephense',
            }
        })

        vim.lsp.config('*', { capabilities = capabilities })

        -------------------------------------------------------------------------
        -- LSP Configurati path aliases
        -------------------------------------------------------------------------
        local function resolve_path_alias(import_path)
            if import_path:match("^@/") then
                local relative_path = import_path:gsub("^@/", "assets/")
                return relative_path
            end
            return import_path
        end

        -------------------------------------------------------------------------
        -- Helper: go to definition with alias handling
        -------------------------------------------------------------------------
        local function goto_definition_with_alias()
            local params = vim.lsp.util.make_position_params()
            vim.lsp.buf_request(0, 'textDocument/definition', params, function(err, result)
                if result and not vim.tbl_isempty(result) then
                    vim.lsp.util.jump_to_location(result[1], 'utf-8')
                else
                    local line = vim.api.nvim_get_current_line()
                    local import_match = line:match("from%s+['\"]([^'\"]+)['\"]") or line:match("import%s+['\"]([^'\"]+)['\"]")
                    if import_match then
                        local resolved = resolve_path_alias(import_match)
                        local root = vim.fs.root(0, { 'package.json', '.git' })
                        if root then
                            local full_path = root .. '/' .. resolved
                            if not full_path:match("%.vue$") and not full_path:match("%.ts$") and not full_path:match("%.js$") then
                                full_path = full_path .. '.vue'
                            end
                            if vim.fn.filereadable(full_path) == 1 then
                                vim.cmd('edit ' .. full_path)
                            else
                                vim.notify("Could not find file: " .. full_path, vim.log.levels.WARN)
                            end
                        end
                    else
                        vim.notify("No definition found", vim.log.levels.WARN)
                    end
                end
            end)
        end

        -------------------------------------------------------------------------
        -- LSP Configurations
        -------------------------------------------------------------------------
        vim.lsp.config('vtsls', {
            root_markers = { 'package.json', 'tsconfig.json', '.git' },
            init_options = {
                plugins = {
                    {
                        name = '@vue/typescript-plugin',
                        location = vim.fn.expand("$MASON/packages/vue-language-server/node_modules/@vue/language-server"),
                        languages = { 'vue' },
                    },
                },
            },
            settings = {
                vtsls = {
                    autoUseWorkspaceTsdk = true,
                    experimental = {
                        completion = { enableServerSideFuzzyMatch = true },
                    },
                },
                typescript = {
                    tsdk = vim.fn.expand("$MASON/packages/typescript-language-server/node_modules/typescript/lib"),
                    updateImportsOnFileMove = { enabled = "always" },
                    suggest = { completeFunctionCalls = true },
                    inlayHints = {
                        parameterNames = { enabled = "literals" },
                        parameterTypes = { enabled = true },
                        variableTypes = { enabled = true },
                        propertyDeclarationTypes = { enabled = true },
                        functionLikeReturnTypes = { enabled = true },
                        enumMemberValues = { enabled = true },
                    },
                },
            },
            filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
        })

        vim.lsp.config('vue_ls', {
            root_markers = { 'package.json', 'vue.config.js', 'vite.config.ts' },
            init_options = {
                vue = {
                    hybridMode = true,
                },
            },
        })

        -------------------------------------------------------------------------
        -- CMP setup
        -------------------------------------------------------------------------
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
            }),
        })

        -------------------------------------------------------------------------
        -- Diagnostics
        -------------------------------------------------------------------------
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

        -------------------------------------------------------------------------
        -- Autocmd: set keymaps after LSP attaches
        -------------------------------------------------------------------------
        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(args)
                local bufnr = args.buf
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if not client then return end

                local map = function(keys, func, desc)
                    if func then
                        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
                    end
                end

                if client.server_capabilities.definitionProvider then
                    if client.name == 'vtsls' or client.name == 'vue_ls' then
                        map('gd', goto_definition_with_alias, 'Go to Definition')
                    else
                        map('gd', vim.lsp.buf.definition, 'Go to Definition')
                    end
                end

                if client.server_capabilities.referencesProvider then
                    map('gr', vim.lsp.buf.references, 'Go to References')
                end
                if client.server_capabilities.hoverProvider then
                    map('K', vim.lsp.buf.hover, 'Hover Documentation')
                end
                if client.server_capabilities.renameProvider then
                    map('<leader>rn', vim.lsp.buf.rename, 'Rename Symbol')
                end
            end,
        })
    end,
}
