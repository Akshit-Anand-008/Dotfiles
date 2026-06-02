vim.api.nvim_create_user_command("Yp",
    function()
        local path = vim.fn.expand("%:~")
        vim.fn.setreg("+", path)
        vim.notify('Yanked: "' .. path .. '"')
    end, {}
)

vim.api.nvim_create_user_command("W",
    function()
        vim.cmd("wa")
        vim.cmd("restart")
    end, {}
)

vim.api.nvim_create_user_command("Q",
    function()
        vim.cmd("wqa")
    end, {}
)
