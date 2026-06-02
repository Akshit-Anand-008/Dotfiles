return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "filename" },
            lualine_c = {
                function() return ("fwd: " .. vim.fn.fnamemodify(vim.fn.expand('%:p:h'), ':~') .. "/") end,
                -- function() return ("cwd: " .. vim.fn.fnamemodify(vim.fn.getcwd(), ':~') .. "/") end,
                function() return ("(" .. require("auto-session.lib").current_session_name(true) .. ")") end
            },
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
