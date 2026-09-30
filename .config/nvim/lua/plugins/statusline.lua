local mile = require "mini.statusline"
local get_cwd = function() return ("cwd: " .. vim.fn.fnamemodify(vim.fn.getcwd(), ':~') .. "/") end

vim.api.nvim_set_hl(0, "MiniStatuslineModeNormal", { fg = "#161616", bg = "#78a9ff", bold = true })
vim.api.nvim_set_hl(0, "MiniStatuslineModeInsert", { fg = "#161616", bg = "#25be6a", bold = true })
vim.api.nvim_set_hl(0, "MiniStatuslineModeVisual", { fg = "#161616", bg = "#be95ff", bold = true })
vim.api.nvim_set_hl(0, "MiniStatuslineModeReplace", { fg = "#161616", bg = "#ee5396", bold = true })
vim.api.nvim_set_hl(0, "MiniStatuslineModeOther", { fg = "#161616", bg = "#3ddbd9", bold = true })
mile.setup()

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
        { hl = mode_hl, strings = { '%P', '│', '%l:%c' } },
    })
end
