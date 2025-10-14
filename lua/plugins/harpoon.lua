return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2", -- make sure you’re on v2
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        local harpoon = require("harpoon")
        local telescope = require("telescope")

        -- Initialize harpoon
        harpoon:setup({
            settings = {
                save_on_toggle = true,
                sync_on_ui_close = true,
            },
        })

        -- Optional: Telescope integration
        telescope.load_extension("harpoon")

        -- Keymaps
        local keymap = vim.keymap.set
        local opts = { noremap = true, silent = true }

        -- Mark file
        keymap("n", "<leader>ha", function()
            harpoon:list():add()
        end, opts)

        -- Toggle quick menu
        keymap("n", "<leader>hh", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, opts)

        -- Use Telescope to open marks
        keymap("n", "<leader>ht", function()
            telescope.extensions.harpoon.marks()
        end, opts)

        -- Quick access to marks (1-5 as example)
        for i = 1, 5 do
            keymap("n", string.format("<leader>%d", i), function()
                harpoon:list():select(i)
            end, opts)
        end

        -- Move marks around
        keymap("n", "<leader>hn", function()
            harpoon:list():next()
        end, opts)
        keymap("n", "<leader>hp", function()
            harpoon:list():prev()
        end, opts)
    end,
}
