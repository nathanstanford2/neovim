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

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              version = 'Lua 5.1',
            },
            diagnostics = {
              globals = { 'bit', 'vim', 'it', 'describe', 'before_each', 'after_each', 'Snacks' },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false, -- avoid unnecessary prompts
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })
    end,
  },
}
