I -- lua/plugins/lsp/tailwind.lua
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

      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
        filetypes = { "html", "css", "scss", "javascript", "typescript", "vue", "svelte", "php" },
        settings = {
          tailwindCSS = {
            experimental = {
              classRegex = {
                "class[:]\\s*['\"]([^'\"]*)['\"]",
                "className[:]\\s*['\"]([^'\"]*)['\"]",
              },
            },
          },
        },
      })
    end,
  },
}
