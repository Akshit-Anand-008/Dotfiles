require('nightfox').setup({ options = { transparent = true }, })
vim.cmd.colorscheme("carbonfox")

vim.api.nvim_set_hl(0, "MiniStatuslineModeNormal", { fg = "#161616", bg = "#78a9ff", bold = true })
vim.api.nvim_set_hl(0, "MiniStatuslineModeOther", { fg = "#161616", bg = "#3ddbd9", bold = true })
