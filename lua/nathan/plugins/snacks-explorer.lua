return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        explorer = { enabled = true },
        picker = {
            enabled = true,
        },
    },
    keys = {
        {
            "<leader>fE",
            function()
                Snacks.explorer()
            end,
            desc = "Explorer Snacks (cwd)",
        },
    },
}
