return {
    "nvim-mini/mini.ai",
    config = function()
        require("mini.ai").setup({
            search_method = 'next',
            custom_textobjects = {
                ['('] = false,
                ['['] = false,
                [']'] = false,
                ['{'] = false,
                ['<'] = false,
                ['>'] = false,
                ["'"] = false,
                ['"'] = false,
                ['`'] = false,
                ['?'] = false,
                ['a'] = false,
                ['b'] = false,
                ['f'] = false,
                ['t'] = false,
                ['q'] = false,
                g = function()
                    local from = { line = 1, col = 1 }
                    local to = {
                        line = vim.fn.line('$'),
                        col = math.max(vim.fn.getline('$'):len(), 1)
                    }
                    return { from = from, to = to }
                end,
            },
            mappings = {
                around_last = 'aL',
                inside_last = 'iL',
                goto_left = '',
                goto_right = '',
            }
        })
        vim.keymap.set({ 'x', 'o' }, 'il', ":<C-u>normal! ^vg_<CR>", { silent = true })
    end
}
