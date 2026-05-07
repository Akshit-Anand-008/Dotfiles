return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = { theme = "auto", icons_enabled = vim.g.have_nerd_font },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "filename" },
            lualine_c = { { "filename", path = 3 } },
            lualine_x = { "diagnostics", "filetype" },
            lualine_y = { function() return require("auto-session.lib").current_session_name(true) end, },
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
    },
}
