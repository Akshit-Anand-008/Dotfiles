return {
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "lua_ls",
                "clangd",
                "pyright",
                "rust_analyzer",
            },
        },
        dependencies = {
            { "williamboman/mason.nvim", opts = {}, },
            { "neovim/nvim-lspconfig" },
        },
    },

    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/lazydev.nvim",                  opts = {} },
}
