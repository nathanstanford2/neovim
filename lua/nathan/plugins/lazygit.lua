return {
    "folke/snacks.nvim",
    opts = {
        lazygit = {
            theme = {
                selectedLineBgcolor = { bg = "CursorLine" },
            }
        },
    },
    keys = {
        {
            "<leader>lg",
            function()
                Snacks.lazygit.open({})
            end,
        },
    },
}
