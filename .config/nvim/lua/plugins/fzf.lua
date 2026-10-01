local picker = require "fzf-lua"
picker.setup({
    fzf_opts = { ["--layout"] = "default" },
    files    = { hidden = false },
    winopts  = {
        fullscreen = true,
        border = "single",
        preview = {
            border     = "single",
            layout     = "vertical",
            horizontal = "right:60%",
            vertical   = "up:45%",
        },
    },
})
vim.keymap.set('n', '<leader>fb', picker.buffers)
vim.keymap.set('n', '<leader>fg', picker.live_grep)
vim.keymap.set('n', '<leader>fh', picker.help_tags)
vim.keymap.set('n', '<leader>fr', picker.oldfiles)
vim.keymap.set('n', '<leader>fm', picker.marks)
vim.keymap.set('n', '<leader>s', picker.lsp_document_symbols)
vim.keymap.set('n', '<leader>fd', picker.builtin)
vim.keymap.set('n', '<leader>ff', picker.files)
vim.keymap.set('n', '<leader><space>', picker.files)
