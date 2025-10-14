return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("nvim-treesitter.configs").setup({
                highlight = { enable = true },
                indent = { enable = true },
                folding = { enable = true },
                ensure_installed = {
                    "php", "vue", "javascript", "typescript", "html", "css", "blade"
                },
                modules = {},
                sync_install = false,
                ignore_install = {},
                auto_install = true,
            })
        end,
    },
}
