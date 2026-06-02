return {
    -- {
    --     "folke/tokyonight.nvim",
    --     opts = { style = "night" },
    --     init = function() vim.cmd.colorscheme("tokyonight") end,
    -- },

    {
        "EdenEast/nightfox.nvim",
        opts = {
            palettes = { carbonfox = { bg1 = "#000000" } },
            groups = { all = { CursorLine = { bg = "#121212" } } },
        },
        init = function() vim.cmd.colorscheme("carbonfox") end,
    },
}
