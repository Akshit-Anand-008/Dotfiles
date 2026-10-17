require "journal".setup({
    root = vim.fn.expand("$DIARY_PATH"),
    vim.keymap.set('n', "<leader>w", "<cmd>Journal day<CR>")
})
