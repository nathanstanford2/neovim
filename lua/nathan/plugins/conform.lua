return {
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre", "BufNewFile" },
        config = function()
            local conform = require("conform")

            conform.setup({
                formatters_by_ft = {
                    php = { "pint" },
                    blade = { "pint" },
                    javascript = { "biome" },
                    typescript = { "biome" },
                    json = { "biome" },
                    css = { "biome" },
                    vue = { "prettier" },
                    html = { "prettier" },
                },
                format_on_save = {
                    lsp_fallback = true,
                    async = false,
                    timeout_ms = 3000,
                },
                formatters = {
                    pint = {
                        command = "pint",
                        stdin = false,
                        args = { "$FILENAME" },
                    },
                    biome = {
                        command = "biome",
                        args = { "format", "--stdin-file-path", "$FILENAME" },
                        stdin = true,
                    },
                    prettier = {
                        command = "prettier",
                        args = { "--stdin-filepath", "$FILENAME" },
                        stdin = true,
                    },
                },
            })

            vim.keymap.set({ "n", "v" }, "<leader>mp", function()
                conform.format({
                    lsp_fallback = true,
                    async = false,
                    timeout_ms = 1000,
                })
            end, { desc = "Format file or range (in visual mode)" })
        end,
    },
}
