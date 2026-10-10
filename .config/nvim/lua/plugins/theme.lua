require('nightfox').setup({
    options = { transparent = true },
})
vim.cmd.colorscheme("carbonfox")

-- require('tokyonight').setup({
--     style = "night",    -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
--     transparent = true, -- Enable this to disable setting the background color
--     plugins = {
--         markdown = false,
--     },
--     styles = {
--         comments = { italic = false },
--         keywords = { italic = false },
--         functions = {},
--         variables = {},
--         sidebars = "transparent", -- style for sidebars, see below
--         floats = "transparent",   -- style for floating windows
--     },
-- })

-- vim.cmd.colorscheme("tokyonight-night")

vim.api.nvim_set_hl(0, "MiniStatuslineModeNormal", { fg = "#161616", bg = "#78a9ff", bold = true })
vim.api.nvim_set_hl(0, "MiniStatuslineModeOther", { fg = "#161616", bg = "#3ddbd9", bold = true })
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
