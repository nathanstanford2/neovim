return {
    "folke/snacks.nvim",
    opts = {
        lazygit = {},
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
