vim.api.nvim_create_user_command("Q",
    function()
        vim.cmd("wqa")
    end, {}
)

vim.api.nvim_create_user_command("R",
    function()
        vim.cmd("wa")
        vim.cmd.restart()
    end, {}
)

vim.api.nvim_create_user_command("C",
    function()
        local view = vim.fn.winsaveview()
        vim.cmd([[g/print.\+);/normal gcc]])
        vim.fn.winrestview(view)
    end, {}
)

vim.api.nvim_create_user_command("L",
    function()
        local view = vim.fn.winsaveview()
        vim.cmd([[%s/\<int\>/ll/ge]])
        vim.cmd([[%s/\<ll main\>/int main/ge]])
        vim.cmd([[%s/:%i\>/:%lli/ge]])
        vim.cmd.nohlsearch()
        vim.fn.winrestview(view)
    end, {}
)
