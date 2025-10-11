-- lua/plugins/lsp/php.lua
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function():
      vim.lsp.config('intelephense', {
          settings = {
              intelephense = {
                  files = { maxSize = 5000000 },
              },
          },
      })
    end,
  },
}
