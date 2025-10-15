return {
    'lewis6991/gitsigns.nvim',
    opts = {
        current_line_blame = true, -- Set to true to enable current line blame by default
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = 'eol', -- Display blame at the end of the line
            delay = 1000,          -- Delay before showing the blame
            ignore_whitespace = false,
        },

        -- Other gitsigns options can go here
    },
    config = function(_, opts)
        require('gitsigns').setup(opts)
    end,
}
