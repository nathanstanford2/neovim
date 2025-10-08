-- lua/plugins/lsp/vue.lua
return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.enable("vue-language-server", vim.lsp.config({
        init_options = {
          vue = { hybridMode = false },
        },
      }))
    end,
  },
}
