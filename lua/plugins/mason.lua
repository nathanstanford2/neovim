-- lua/plugins/lsp/mason.lua
return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "intelephense",
          "ts_ls",
          "vue_ls",
          "lua_ls",
          "tailwindcss",
        },
      })
    end,
  },
}
