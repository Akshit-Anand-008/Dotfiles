return {
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        opts = { style = "night" },
        config = function(_, opts)
            require("tokyonight").setup(opts)
            vim.cmd.colorscheme("tokyonight")
        end,
    },
    -- {
    --     "catppuccin/nvim",
    --     priority = 1000,
    --     opts = { flavour = "mocha", },
    --     config = function(_, opts)
    --         require("catppuccin").setup(opts)
    --         vim.cmd.colorscheme("catppuccin")
    --     end,
    -- }
}
