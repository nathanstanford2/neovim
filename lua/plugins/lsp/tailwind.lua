-- lua/plugins/lsp/tailwind.lua
return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.enable("tailwindcss", vim.lsp.config({
        on_attach = function() end,
      }))
    end,
  },
}
