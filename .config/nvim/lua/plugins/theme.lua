-- require('nightfox').setup({ options = { transparent = true }, })
-- vim.cmd.colorscheme("carbonfox")

require "tokyonight".setup({
    style = "night",
    transparent = true,
    styles = {
        comments = { italic = false },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "transparent",
        floats = "transparent",
    },
})
vim.cmd.colorscheme("tokyonight-night")
vim.api.nvim_set_hl(0, "IblScope", { fg = "#7b7c7e" })

vim.api.nvim_set_hl(0, "Todo", { link = "Comment" })
vim.api.nvim_set_hl(0, "Cursorline", { bg = "None" })
vim.api.nvim_set_hl(0, "VisualCursor", { bg = "#c099ff" })
vim.api.nvim_set_hl(0, "NormalCursor", { bg = "#ffffff" })
vim.api.nvim_set_hl(0, "TerminalCursor", { bg = "#3ddbd9" })
vim.opt.guicursor = {
    "a:blinkon0",             -- Disable blinking
    "n:block-NormalCursor",   -- Normal: White block
    "t:block-TerminalCursor", -- Terminal: Blue
    "v:block-VisualCursor",   -- Visual: Purple block
    "i-c-ci:ver25-Cursor",    -- Insert: Thin vertical line
    "r-cr-ve:hor20-Cursor",   -- Replace: Horizontal bar
}
