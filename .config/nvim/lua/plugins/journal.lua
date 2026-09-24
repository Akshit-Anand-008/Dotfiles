require "journal".setup({
    root = vim.fn.expand("$DIARY_PATH"),
    vim.keymap.set('n', "<leader>t", "<cmd>Journal day<CR>")

})
