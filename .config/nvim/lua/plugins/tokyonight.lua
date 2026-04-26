return {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
        style = "night",
        on_highlights = function(hl, c)
            hl.MatchParen = {
                bg = "#647fcb",
                fg = "#ff9e64",
                bold = true,
            }
        end,
    },
    init = function()
        vim.cmd.colorscheme("tokyonight-night")
    end,
}
