return {
    "saghen/blink.cmp",
    version = '1.*',
    opts = {
        snippets = { preset = 'luasnip' },
        keymap = {
            ['<C-n>'] = { 'select_next', 'fallback' },
            ['<C-p>'] = { 'select_prev', 'fallback' },
        },
        appearance = { nerd_font_variant = 'mono' },
        completion = {
            documentation = { auto_show = false },
            menu = { auto_show = false },
        },
        sources = { default = { 'snippets', 'buffer' }, },
        fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
}
