return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = { "cpp", "python", "rust" },
        highlight = { enable = true },
        indent = { enable = true },
    },
}
