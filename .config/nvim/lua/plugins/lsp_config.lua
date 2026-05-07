return {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
        { "williamboman/mason.nvim", opts = {}, },
        { "neovim/nvim-lspconfig" },
    },
}
