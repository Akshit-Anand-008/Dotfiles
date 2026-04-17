return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		require("lualine").setup({
			options = { theme = "tokyonight", icons_enabled = vim.g.have_nerd_font },
			sections = {
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {
					{ "filename", path = 1 },
					{
						function()
							local line = vim.api.nvim_win_get_cursor(0)[1] - 1
							local diagnostics = vim.diagnostic.get(0, { lnum = line })
							if #diagnostics == 0 then
								return ""
							end

							local msg = (diagnostics[1] and diagnostics[1].message) or "Unknown error"
							local max_width = 80 -- Adjust this number based on your screen size
							if #msg > max_width then
								return "  " .. string.sub(msg, 1, max_width) .. "..."
							end
							return "  " .. msg
						end,
						color = { fg = "#f7768e" },
					},
				},
			},
		})
	end,
}
