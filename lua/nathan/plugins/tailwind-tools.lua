return {
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
      require("colorizer").setup({
        filetypes = { "vue", "blade", "html", "php", "css" },
      })
    end,
  },
}
