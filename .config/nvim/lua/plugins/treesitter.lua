return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = { "c", "cpp", "python", "rust", "lua", "latex" },
        highlight = { enable = true },
        indent = { enable = true },
    },
}
