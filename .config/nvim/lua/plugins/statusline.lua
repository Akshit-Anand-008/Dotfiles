local mile = require "mini.statusline"
mile.setup()
local get_cwd = function()
    return ("cwd: " .. vim.fn.fnamemodify(vim.fn.getcwd(), ':~') .. "/")
end

vim.api.nvim_set_hl(0, "MiniStatuslineModeNormal", { fg = "#161616", bg = "#78a9ff", bold = true })
vim.api.nvim_set_hl(0, "MiniStatuslineModeOther", { fg = "#161616", bg = "#3ddbd9", bold = true })

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
