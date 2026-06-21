return {
    "nvim-lualine/lualine.nvim",
    opts = {
        sections = {
            lualine_a = { "mode" },
            lualine_b = { { "filename", path = 1 } },
            lualine_c = { function() return ("cwd: " .. vim.fn.fnamemodify(vim.fn.getcwd(), ':~') .. "/") end },
            lualine_x = { "diagnostics", "filetype" },
            lualine_y = { "progress" },
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
    }
}
