return {
    "nvim-mini/mini.ai",
    config = function()
        require('mini.ai').setup({
            custom_textobjects = {
                ['('] = false,
                ['{'] = false,
                b = false,
                B = false,
                a = false,
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
    end
}
