return {
    -- {
    --     "folke/tokyonight.nvim",
    --     priority = 1000,
    --     opts = { style = "night" },
    --     init = function
    --         require("tokyonight").setup(opts)
    --         vim.cmd.colorscheme("tokyonight")
    --     end,
    -- },
    {
        "EdenEast/nightfox.nvim",
        priority = 1000,
        opts = {
            palettes = { carbonfox = { bg1 = "#000000" } },
            groups = { all = { CursorLine = { bg = "#121212" } } },
        },
        init = function()
            vim.cmd.colorscheme("carbonfox")
        end,
    },
}
