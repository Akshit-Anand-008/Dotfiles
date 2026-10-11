require('mini.base16').setup({
    palette = {
        base00 = '#1a1b26', -- Default Background
        base01 = '#16161e', -- Lighter Background (Status bars, line numbers)
        base02 = '#2fa1d6', -- Selection Background (or #2f354a / #33467c)
        base03 = '#565f89', -- Comments, Invisibles, Line Highlighting
        base04 = '#7aa2f7', -- Dark Foreground (Used for status bars)
        base05 = '#c0caf5', -- Default Foreground (Text)
        base06 = '#c0caf5', -- Light Foreground (Not often used)
        base07 = '#7dcfff', -- Lightest Foreground
        base08 = '#f7768e', -- Variables, XML Tags, Markup Errors (Red)
        base09 = '#ff9e64', -- Integers, Boolean, Constants, XML Attributes (Orange)
        base0A = '#e0af68', -- Classes, Markup Bold, Search Text (Yellow)
        base0B = '#9ece6a', -- Strings, Inherited Class, Markup Code (Green)
        base0C = '#7dcfff', -- Support, Regular Expressions, Escape Characters (Cyan)
        base0D = '#7aa2f7', -- Functions, Methods, Attribute IDs, Headings (Blue)
        base0E = '#bb9af7', -- Keywords, Storage, Selector, Markup Italic (Purple)
        base0F = '#db4b4b', -- Deprecated, Opening/Closing Embedded Language Tags (Dark Red/Brow
    },
    use_cterm = false,
    plugins = { default = true, },
})
