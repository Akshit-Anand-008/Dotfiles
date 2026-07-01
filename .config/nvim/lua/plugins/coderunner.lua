return {
    "CRAG666/code_runner.nvim",
    config = function()
        require('code_runner').setup({
            focus = true,
            startinsert = true,
            -- term = { position = "horizontal", size = 10 },
            term = { position = "vertical", size = 40 },
            filetype = {
                cpp = "cd $dir && g++ $fileName && ./a.out",
                tex = "cd $dir && pdflatex $fileName",
                lua = "cd $dir && lua $fileName",
                go = "cd $dir && go run $fileName",
                -- rust = "cd $dir && cargo run",
                rust = "cd $dir && cargo run --bin $fileNameWithoutExt",
            }
        })
        vim.keymap.set("n", "<leader>r", function()
            vim.cmd.write()
            vim.cmd.RunCode()
        end)
        vim.keymap.set("n", "<leader>t", [[<leader>r<C-\><C-n>"api<CR><C-w><C-w>w]], { remap = true })
    end
}
