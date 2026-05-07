return {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
    dependencies = {
        { "williamboman/mason.nvim", opts = {}, },
        { "neovim/nvim-lspconfig" },
    },
}
