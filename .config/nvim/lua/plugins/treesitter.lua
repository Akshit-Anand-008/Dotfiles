return {
    "nvim-treesitter/nvim-treesitter",

    build = ":TSUpdate",
    opts = {
        ensure_installed = { "c", "cpp", "python", "rust", "lua", "vim", "vimdoc", "query", "latex", "javascript", "html", "css", "markdown" },
        highlight = { enable = true },
        indent = { enable = true },
    },
}
