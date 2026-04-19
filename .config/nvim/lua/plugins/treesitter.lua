return {
    "nvim-treesitter/nvim-treesitter",

    build = ":TSUpdate",
    opts = {
        ensure_installed = { "c", "cpp", "python", "rust", "lua", "vim", "vimdoc", "query", "latex" },
        highlight = { enable = true },
        indent = { enable = true },
    },
}
