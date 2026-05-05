return {
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            { "williamboman/mason.nvim", opts = {}, },
            { "neovim/nvim-lspconfig" },
        },
    },

    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/lazydev.nvim",                  opts = {} },
}
