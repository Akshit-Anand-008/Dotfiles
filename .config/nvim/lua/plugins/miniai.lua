return {
    "nvim-mini/mini.ai",
    config = function()
        require("mini.ai").setup({
            custom_textobjects = {
                a = false,
                b = false,
                f = false,
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
            }
        })

        vim.keymap.set({ 'x', 'o' }, 'il', ":<C-u>normal! ^vg_<CR>", { silent = true })

        vim.keymap.set({ 'x', 'o' }, 'i}', "in{", { remap = true })
        vim.keymap.set({ 'x', 'o' }, 'a}', "an{", { remap = true })
        vim.keymap.set({ 'x', 'o' }, 'i{', "iL{", { remap = true })
        vim.keymap.set({ 'x', 'o' }, 'a{', "aL{", { remap = true })

        vim.keymap.set({ 'x', 'o' }, 'i)', "in(", { remap = true })
        vim.keymap.set({ 'x', 'o' }, 'a)', "an(", { remap = true })
        vim.keymap.set({ 'x', 'o' }, 'i(', "iL(", { remap = true })
        vim.keymap.set({ 'x', 'o' }, 'a(', "aL(", { remap = true })
    end
}
