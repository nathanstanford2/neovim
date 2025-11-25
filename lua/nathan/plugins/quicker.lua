return {
    {
        'stevearc/quicker.nvim',
        ft = "qf",

        ---@module "quicker"
        ---@type quicker.SetupOptions
        opts = {},

        config = function()
            local keymap = vim.keymap
            local quicker = require("quicker")


            keymap.set("n", "<leader>q", function()
                quicker.toggle()
            end, {
                desc = "Toggle quickfix",
            })
            keymap.set("n", "<leader>l", function()
                quicker.toggle({ loclist = true })
            end, {
                desc = "Toggle loclist",
            })

            quicker.setup({
                keys = {
                    {
                        ">",
                        function()
                            require("quicker").expand({ before = 2, after = 2, add_to_existing = true })
                        end,
                        desc = "Expand quickfix context",
                    },
                    {
                        "<",
                        function()
                            require("quicker").collapse()
                        end,
                        desc = "Collapse quickfix context",
                    },
                },
            })
        end,
    }
}
