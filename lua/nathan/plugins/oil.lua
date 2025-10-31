return {
    "stevearc/oil.nvim",
    opts = {},       -- You can add your oil.nvim configuration options here
    -- Optional: Lazy load oil.nvim
    cmd = "Oil",     -- Load when :Oil is called

    keys = {
        { "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
    },
}
