require("mini.base16").setup({
    palette = {
        -- Base UI & Background Tones (Tokyonight Dark Grays & Blues)
        base00 = "#1a1b26", -- Default Background (c.bg)
        base01 = "#16161e", -- Darker Background / Dark Statusline (c.bg_dark)
        base02 = "#292e42", -- Selection Background / Line Highlight (c.bg_highlight)
        base03 = "#565f89", -- Comments / Secondary UI (c.comment)
        base04 = "#737aa2", -- Dark Foreground / Statuslines (c.dark5)
        base05 = "#c0caf5", -- Default Foreground (c.fg)
        base06 = "#a9b1d6", -- Light Foreground / Subdued text (c.fg_dark)
        base07 = "#c8d3f5", -- Brightest Foreground / Headers (c.fg_gutter / light fg)

        -- Accent Colors mapped to Tokyonight's core palette
        base08 = "#f7768e", -- Variables, XML Tags (c.red)
        base09 = "#ff9e64", -- Constants, Numbers, Booleans (c.orange)
        base0A = "#e0af68", -- Classes, Types, Search highlights (c.yellow)
        base0B = "#9ece6a", -- Strings, Inherited Class (c.green)
        base0C = "#7dcfff", -- Support, Regex, Escape Characters (c.cyan)
        base0D = "#7aa2f7", -- Functions, Methods, Headings (c.blue)
        base0E = "#bb9af7", -- Keywords, Storage, Structures (c.purple)
        base0F = "#db4b4b", -- Deprecated, Delimiters, Errors (c.red1 / c.teal)
    },
})
local transparent_groups = {
    "Normal",
    "NormalNC",
    "NormalFloat",
    "FloatBorder",
    "SignColumn",
    "LineNr",
    "Folded",
    "NonText",
}

-- Define the missing Ibl highlight groups so it doesn't throw E5113
vim.api.nvim_set_hl(0, "IblIndent", { fg = "#32344a" }) -- base02 or dark muted color
vim.api.nvim_set_hl(0, "IblScope", { fg = "#7aa2f7" })  -- base0D or your accent color

require("ibl").setup({
    -- Optional: link to your created groups
    indent = { highlight = "IblIndent" },
    scope = { highlight = "IblScope" },
})

for _, group in ipairs(transparent_groups) do
    vim.api.nvim_set_hl(0, group, { bg = "NONE" })
end
