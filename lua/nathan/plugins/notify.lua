return {
  "rcarriga/nvim-notify",
  config = function()
    vim.defer_fn(function()
        require("notify").setup({
            background_colour = "#1e1e2e", -- use your editor's Normal bg
        })
    end, 100)
  end,
}
