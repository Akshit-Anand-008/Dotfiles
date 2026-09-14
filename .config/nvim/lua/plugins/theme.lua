require('nightfox').setup({
    options = {
        transparent = true,
        -- styles = { keywords = "italic" }
    },
    groups = {
        all = {
            CursorLine = { bg = "NONE" },
            TelescopeSelection = { bg = "palette.sel0" },
            TelescopeSelectionCaret = { bg = "palette.sel0" },
        }
    }
})
vim.cmd.colorscheme("carbonfox")

-- require("tokyonight").setup({
--     transparent = true,
--     on_highlights = function(hl, c) hl.CursorLine = { bg = "NONE" } end
-- })
-- vim.cmd.colorscheme("tokyonight-storm")
