return {
    {
        "kevinhwang91/nvim-ufo",
        dependencies = {
            "kevinhwang91/promise-async",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            vim.o.foldcolumn = "1"
            vim.o.foldlevel = 99
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true

            require("ufo").setup({
                provider_selector = function()
                    return { "lsp", "indent" }
                end,
            })

            vim.keymap.set("n", "zR", function() require("ufo").openAllFolds() end, { desc = "Open all folds" })
            vim.keymap.set("n", "zM", function() require("ufo").closeAllFolds() end, { desc = "Close all folds" })
            vim.keymap.set("n", "zK", function()
                local winid = require("ufo").peekFoldedLinesUnderCursor()

                if not winid then
                    vim.lsp.buf.hover()
                end
            end, { desc = "Close all folds" })
        end,
    },
}
