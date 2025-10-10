-- lua/plugins/lsp/php.lua
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      if pcall(require, "cmp_nvim_lsp") then
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
      end

      lspconfig.intelephense.setup({
        capabilities = capabilities,
        settings = {
          intelephense = {
            files = { maxSize = 5000000 },
          },
        },
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = false
        end,
      })
    end,
  },
}
