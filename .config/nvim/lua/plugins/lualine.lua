return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
        require("lualine").setup({
            options = { theme = "carbonfox", icons_enabled = vim.g.have_nerd_font },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "filename" },
                lualine_c = {
                    {
                        function()
                            local bufnr = 0
                            local line = vim.api.nvim_win_get_cursor(0)[1] - 1
                            local diagnostics = vim.diagnostic.get(bufnr, { lnum = line })
                            if #diagnostics == 0 then
                                return ""
                            end
                            table.sort(diagnostics, function(a, b)
                                return a.severity < b.severity
                            end)
                            local msg = diagnostics[1].message or "Unknown error"
                            local max_width = 80
                            msg = msg:gsub("\n", " ")
                            if #msg > max_width then
                                return "  " .. string.sub(msg, 1, max_width) .. "..."
                            end
                            return "  " .. msg
                        end,
                        color = { fg = "#f7768e" },
                    },
                },
                lualine_x = {},
                lualine_y = { "diagnostics", "filetype" },
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
