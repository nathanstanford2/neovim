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
                    "intelephense", -- PHP
                    "ts_ls",     -- TypeScript
                    "volar",     -- Vue (installs vue-language-server)
                    "lua_ls",    -- Lua
                    "tailwindcss", -- Tailwind
                    "html",      -- HTML for Blade + Vue templates
                    "cssls",     -- CSS
                },
                automatic_enable = true, -- Auto-enable installed servers
            })
        end,
    },
}
