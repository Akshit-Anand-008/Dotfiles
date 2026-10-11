vim.pack.add { { src = "https://github.com/catppuccin/nvim", name = "catppuccin" } }

require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = {     -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true, -- disables setting the background color.
    float = {
        transparent = true,        -- enable transparent floating windows
        solid = true,              -- use solid styling for floating windows, see |winborder|
    },
    term_colors = false,           -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false,           -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15,         -- percentage of the shade to apply to the inactive window
    },
    no_italic = true,              -- Force no italic
    no_bold = true,                -- Force no bold
    no_underline = false,          -- Force no underline
    styles = {                     -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = {},             -- Change the style of comments
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
        virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
            ok = { "italic" },
        },
        underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
            ok = { "underline" },
        },
        inlay_hints = {
            background = true,
        },
    },
    color_overrides = {
        mocha = {
            rosewater = "#f7768e", -- TokyoNight: red / warm accent (#f7768e)
            flamingo  = "#ff9e64", -- TokyoNight: orange / light accent (#ff9e64)
            pink      = "#bb9af7", -- TokyoNight: magenta / purple (#bb9af7)
            mauve     = "#bb9af7", -- TokyoNight: purple / keywords (#bb9af7)
            red       = "#f7768e", -- TokyoNight: red / errors (#f7768e)
            maroon    = "#db4b4b", -- TokyoNight: red1 / dark red (#db4b4b)
            peach     = "#ff9e64", -- TokyoNight: orange / constants & numbers (#ff9e64)
            yellow    = "#e0af68", -- TokyoNight: yellow / classes & warnings (#e0af68)
            green     = "#9ece6a", -- TokyoNight: green / strings (#9ece6a)
            teal      = "#73daca", -- TokyoNight: teal / regex & escape (#73daca)
            sky       = "#b4f9f8", -- TokyoNight: cyan0 / bright cyan (#b4f9f8)
            sapphire  = "#7dcfff", -- TokyoNight: cyan / attributes & properties (#7dcfff)
            blue      = "#7aa2f7", -- TokyoNight: blue / functions (#7aa2f7)
            lavender  = "#7dcfff", -- TokyoNight: blue0 / accent blue-cyan (#7dcfff)
            text      = "#c0caf5", -- TokyoNight: fg / main text (#c0caf5)
            subtext1  = "#a9b1d6", -- TokyoNight: fg_dark / secondary text (#a9b1d6)
            subtext0  = "#9aa5ce", -- TokyoNight: dark5 / muted text (#9aa5ce)
            overlay2  = "#7a88cf", -- TokyoNight: blue2 / active borders (#7a88cf)
            overlay1  = "#565f89", -- TokyoNight: comment / comments & folds (#565f89)
            overlay0  = "#414868", -- TokyoNight: dark3 / subtle borders (#414868)
            surface2  = "#3b4261", -- TokyoNight: fg_gutter / line numbers (#3b4261)
            surface1  = "#283451", -- TokyoNight: bg_highlight / cursor line & select (#283451)
            surface0  = "#24283b", -- TokyoNight: bg_popup / dropdowns & floats (#24283b)
            base      = "#1a1b26", -- TokyoNight: bg / main editor background (#1a1b26)
            mantle    = "#16161e", -- TokyoNight: bg_dark / sidebars & statusline (#16161e)
            crust     = "#13141c", -- TokyoNight: bg_statusline / darkest UI
        },
    },
    custom_highlights = {},
    auto_integrations = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
    },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin-nvim"
vim.api.nvim_set_hl(0, "Todo", { link = "Comment" })
vim.api.nvim_set_hl(0, "CursorLinenr", { fg = "#e0af68", bold = true })
vim.api.nvim_set_hl(0, "Cursorline", { bg = "None" })
vim.api.nvim_set_hl(0, "VisualCursor", { bg = "#c099ff" })
vim.api.nvim_set_hl(0, "NormalCursor", { bg = "#ffffff" })
vim.api.nvim_set_hl(0, "TerminalCursor", { bg = "#3ddbd9" })
vim.opt.guicursor = {
    "a:blinkon0",                -- Disable blinking
    "n:block-NormalCursor",      -- Normal: White block
    "t:block-TerminalCursor",    -- Terminal: Blue
    "v:block-VisualCursor",      -- Visual: Purple block
    "i-c-ci:ver25-NormalCursor", -- Insert: Thin vertical line
    "r-cr-ve:hor20-Cursor",      -- Replace: Horizontal bar
}
