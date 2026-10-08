local mile = require "mini.statusline"
mile.setup()
local get_cwd = function()
    return ("cwd: " .. vim.fn.fnamemodify(vim.fn.getcwd(), ':~') .. "/")
end

mile.active = function()
    local mode, mode_hl = mile.section_mode({ trunc_width = 120 })
    local diagnostics   = mile.section_diagnostics({ trunc_width = 75 })
    return mile.combine_groups({
        { hl = mode_hl,                  strings = { mode } },
        { hl = 'MiniStatuslineFileinfo', strings = { '%f' } },
        '%<',
        { hl = 'MiniStatuslineFilename', strings = { get_cwd() } },
        '%=',
        { strings = { diagnostics } },
        { strings = { '%y' } },
        { hl = mode_hl, strings = { '%p%%', '│', '%l:%c' } },
    })
end

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
