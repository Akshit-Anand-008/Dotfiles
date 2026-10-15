require('nightfox').setup({ options = { transparent = true, terminal_colors = false } })
vim.cmd.colorscheme("carbonfox")

vim.api.nvim_set_hl(0, "MiniStatuslineModeNormal", { fg = "#161616", bg = "#78a9ff", bold = true })
vim.api.nvim_set_hl(0, "MiniStatuslineModeOther", { fg = "#161616", bg = "#3ddbd9", bold = true })
vim.api.nvim_set_hl(0, "Todo", { link = "Comment" })
vim.api.nvim_set_hl(0, "Cursorline", { bg = "None" })
vim.api.nvim_set_hl(0, "VisualCursor", { bg = "#c099ff" })
vim.api.nvim_set_hl(0, "NormalCursor", { bg = "#ffffff" })
vim.api.nvim_set_hl(0, "TerminalCursor", { bg = "#3ddbd9" })
vim.opt.guicursor = {
    "a:blinkon0",
    "n:block-NormalCursor",
    "t:block-TerminalCursor",
    "v:block-VisualCursor",
    "i-c-ci:ver25-Cursor",
    "r-cr-ve:hor20-Cursor",
}
