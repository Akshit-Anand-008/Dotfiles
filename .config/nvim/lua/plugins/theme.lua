return {
    {
        "EdenEast/nightfox.nvim",
        opts = {
            palettes = { carbonfox = { bg1 = "#000000" } },
            groups = { all = { CursorLine = { bg = "#121212" } } },
        },
        init = function() vim.cmd.colorscheme("carbonfox") end,
    },

    -- {
    --     "folke/tokyonight.nvim",
    --     opts = { style = "night" },
    --     init = function() vim.cmd.colorscheme("tokyonight") end,
    -- },

    -- {
    --     "ellisonleao/gruvbox.nvim",
    --     init = function() vim.cmd.colorscheme("gruvbox") end
    -- },

    -- {
    --     "catppuccin/nvim",
    --     name = "catppuccin",
    --     opts = { flavour = "mocha" },
    --     init = function() vim.cmd.colorscheme("catppuccin") end,
    -- },
}
