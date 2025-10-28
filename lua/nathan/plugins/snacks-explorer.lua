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
                Snacks.explorer.reveal()
            end,
            desc = "Explorer Snacks (cwd)",
        },
        { "<c-b>", "<leader>fE", desc = "Explorer Snacks (cwd)", remap = true },
    },
}
