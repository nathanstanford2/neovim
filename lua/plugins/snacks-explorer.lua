return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        explorer = { enabled = true },
        picker = {
            enabled = true,
            sources = {
                explorer = {
                    -- this is what you want to adjust:
                    layout = {
                        layout = {
                            position = "right",
                            -- you can also tweak width, etc if desired
                        },
                    },
                },
            },
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
