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
vim.api.nvim_set_hl(0, "MiniStatuslineFileinfo", { fg = "#b6b8bb", bg = "#252525" })
vim.api.nvim_set_hl(0, "MiniStatuslineFilename", { fg = "#b6b8bb", bg = "#0c0c0c" })
