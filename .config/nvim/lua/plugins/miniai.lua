return {
    "nvim-mini/mini.ai",
    config = function()
        require('mini.ai').setup({
            custom_textobjects = {
                ['('] = false,
                ['{'] = false,
                b = false,
                B = false,
                g = function()
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
            },
        })
        vim.keymap.set({ "x", "o" }, "il", ":<C-u>normal! ^vg_<CR>", { silent = true })
        vim.keymap.set({ "x", "o" }, 'ib', "in)", { remap = true })
        vim.keymap.set({ "x", "o" }, 'iB', "in}", { remap = true })
        vim.keymap.set({ "x", "o" }, 'ab', "an)", { remap = true })
        vim.keymap.set({ "x", "o" }, 'aB', "an}", { remap = true })
    end
}
