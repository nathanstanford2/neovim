return {
    desc = "Snacks File Explorer",
    recommended = true,
    "folke/snacks.nvim",
    opts = {
        explorer = {
            layout = { layout = { position = "right" } },
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
        { "<c-b>", "<leader>fE", desc = "Explorer Snacks (cwd)", remap = true },
    },
}
