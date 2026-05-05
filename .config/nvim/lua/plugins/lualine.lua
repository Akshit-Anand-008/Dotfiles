return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
        require("lualine").setup({
            options = { theme = "auto", icons_enabled = vim.g.have_nerd_font },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "filename" },
                lualine_c = { { "filename", path = 3 } },
                lualine_x = { "diagnostics", "filetype" },
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
    end,
}
