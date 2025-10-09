return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      vue_ls = {
        init_options = {
          vue = {
            hybridMode = true,
          },
        },
        filetypes = { "vue" },
        on_attach = function(client, bufnr)
          -- Optional: stop tsserver from also attaching
          for _, c in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
            if c.name == "tsserver" then
              c.stop()
            end
          end
        end,
      },
    },
  },
}
