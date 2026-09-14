require('code_runner').setup({
    focus = true,
    startinsert = true,
    -- term = { position = "horizontal", size = 10 },
    term = { position = "vertical", size = 40 },
    filetype = {
        cpp = "cd $dir && g++ $fileName && ./a.out",
        -- tex = "cd $dir && pdflatex $fileName",
        -- lua = "cd $dir && lua $fileName",
    }
})

vim.keymap.set("n", "<leader>r", function()
    vim.cmd.write()
    require("code_runner").run_code()
end, { desc = "Save and run code" })
vim.keymap.set("n", "<leader>t", [[<leader>r<C-\><C-n>"api<CR><C-w><C-w>w]], { remap = true })
