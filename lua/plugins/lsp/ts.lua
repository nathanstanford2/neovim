return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      tsserver = {
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = function()
                local ok, registry = pcall(require, "mason-registry")
                if not ok then return "" end
                local pkg = registry.get_package("vue-language-server")
                return pkg:get_install_path() .. "/node_modules/@vue/language-server"
              end,
              languages = { "vue" },
            },
          },
        },
        filetypes = {
          "javascript", "typescript",
          "javascriptreact", "typescriptreact",
          "vue", -- needed for Hybrid mode
        },
      },
    },
  },
}
