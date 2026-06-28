return {
    "luukvbaal/nnn.nvim",
    config = function()
        local builtin = require("nnn").builtin
        require("nnn").setup({
            explorer = { fullscreen = true }
        })
        vim.keymap.set("n", "<leader>fl", vim.cmd.NnnExplorer)
    end
}
