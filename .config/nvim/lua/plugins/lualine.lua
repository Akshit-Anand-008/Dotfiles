require("lualine").setup({
    options = { section_separators = '', component_separators = '|' },
    sections = {
        lualine_a = { "mode" },
        lualine_b = {},
        lualine_c = { { "filename", path = 1 }, function() return ("cwd: " .. vim.fn.fnamemodify(vim.fn.getcwd(), ':~') .. "/") end },
        lualine_x = { "diagnostics", "filetype", "progress" },
        lualine_y = {},
        lualine_z = { "location" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = { "filename" },
        lualine_c = {},
        lualine_x = {},
        lualine_y = { "filetype" },
        lualine_z = {},
    }
})
