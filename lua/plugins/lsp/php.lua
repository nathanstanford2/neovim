-- lua/plugins/lsp/php.lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = {},
    config = function(_, opts)
      vim.lsp.enable("intelephense", vim.lsp.config({
        settings = {
          intelephense = {
            files = { maxSize = 5000000 },
          },
        },
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = false
        end,
      }))
    end,
  },
}
