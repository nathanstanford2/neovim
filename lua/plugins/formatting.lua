return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          php = { "pint" },
          blade = { "pint" },
          javascript = { "biome" },
          typescript = { "biome" },
          json = { "biome" },
          css = { "biome" },
          -- Vue and HTML use their language servers (e.g. Volar, html-lsp)
          vue = {},
          html = {},
        },
        format_on_save = {
          lsp_fallback = true,
          async = false,
          timeout_ms = 2000,
        },
      })

      local conform = require("conform")
      conform.formatters = {
        pint = {
          command = "pint",
          stdin = false,
          args = { "$FILENAME" },
        },
        biome = {
          command = "biome",
          args = { "format", "--stdin-file-path", "$FILENAME" },
          stdin = true,
        },
      }
    end,
  },
}

