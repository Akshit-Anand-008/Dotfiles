vim.api.nvim_create_user_command("Yp",
    function()
        local path = vim.fn.expand("%:~")
        vim.fn.setreg("+", path)
        vim.notify('Yanked: "' .. path .. '"')
    end, {}
)

vim.api.nvim_create_user_command("R",
    function()
        vim.cmd("wa")
        vim.cmd("restart")
    end, {}
)

vim.api.nvim_create_user_command("Q", function() vim.cmd("wqa") end, {})

vim.api.nvim_create_user_command("L",
    function()
        local keys = vim.keycode("mz:%s/\\<int\\>/ll/g<CR>/ll main<CR>ciwint<Esc>")
        vim.api.nvim_feedkeys(keys, "n", true)
        local keys = vim.keycode(":%s/:%i/:%lli/g<CR>`z")
        vim.api.nvim_feedkeys(keys, "n", true)
        vim.cmd.nohlsearch()
    end, {}
)
