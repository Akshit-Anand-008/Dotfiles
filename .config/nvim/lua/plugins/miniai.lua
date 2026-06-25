return {
    "nvim-mini/mini.ai",
    config = function()
        local ai = require "mini.ai"
        ai.setup({
            search_method = 'next',
            custom_textobjects = {
                ['a'] = false,
                ['b'] = false,
                ['f'] = false,
                ['}'] = function(o) return ai.find_textobject(o, '{', { search_method = 'next' }) end,
                [')'] = function(o) return ai.find_textobject(o, '(', { search_method = 'next' }) end,
                ['g'] = function()
                    local from = { line = 1, col = 1 }
                    local to = {
                        line = vim.fn.line('$'),
                        col = math.max(vim.fn.getline('$'):len(), 1)
                    }
                    return { from = from, to = to }
                end
            },
            mappings = {
                around_last = 'aL',
                inside_last = 'iL',
                goto_left = '',
                goto_right = '',
            }
        })
        vim.keymap.set({ 'x', 'o' }, 'il', ":<C-u>normal! ^vg_<CR>", { silent = true })
        vim.keymap.set({ 'x', 'o' }, 'i{', "iL{", { remap = true })
        vim.keymap.set({ 'x', 'o' }, 'a{', "aL{", { remap = true })
        vim.keymap.set({ 'x', 'o' }, 'i(', "iL(", { remap = true })
        vim.keymap.set({ 'x', 'o' }, 'a(', "aL(", { remap = true })
    end
}
