return {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
        style = "night",
        on_highlights = function(hl, c)
            hl.MatchParen = {
                bg = "#3b4261",
                fg = c.orange,
                bold = true,
            }
        end,
    },
    config = function(_, opts)
        require("tokyonight").setup(opts)
        vim.cmd.colorscheme("tokyonight")
    end,
}
