return {
    -- {
    --     "folke/tokyonight.nvim",
    --     priority = 1000,
    --     opts = { style = "night" },
    --     config = function(_, opts)
    --         require("tokyonight").setup(opts)
    --         vim.cmd.colorscheme("tokyonight")
    --     end,
    -- },
    {
        "EdenEast/nightfox.nvim",
        priority = 1000,
        config = function()
            require("nightfox").setup({
                options = {},
                palettes = { carbonfox = { bg1 = "#000000", bg0 = "#000000", }, },
                groups = { all = { CursorLine = { bg = "#121212" }, } },
            })
            vim.cmd.colorscheme("carbonfox")
        end,
    },
}
