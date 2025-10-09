return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    config = function()
        require("neo-tree").setup({
            filesystem = {
                window = {
                    position = "right",
                    width = 30,
                }
            },
            buffers = {
                window = {
                    position = "right",
                },
            },
            git_status = {
                window = {
                    position = "right",
                },
            },
        })
        vim.keymap.set('n', '<C-b>', '<Cmd>Neotree toggle<CR>', { desc = "Toggle Neo-tree" })
    end,
    lazy = false, -- neo-tree will lazily load itself
  }
}
