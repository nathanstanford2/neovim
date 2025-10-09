return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    event = "VeryLazy",
    config = function()
        require("mason-tool-installer").setup({
            ensure_installed = { "pint", "biome" },
            auto_update = false,
        })
    end,
}
