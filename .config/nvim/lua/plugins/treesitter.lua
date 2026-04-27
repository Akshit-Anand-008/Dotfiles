return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        auto_install = { enable = true },
        highlight = { enable = true },
        indent = { enable = true },
    },
}
