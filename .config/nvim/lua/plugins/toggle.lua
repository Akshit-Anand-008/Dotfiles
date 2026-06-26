return {
    "rmagatti/alternate-toggler",
    config = function()
        require("alternate-toggler").setup({
            alternates = {
                { "||",   "&&" },
                { ">",    ">=" },
                { "<",    "<=" },
                { "===",  "!==" },
                { "==",   "!=" },
                { "true", "false" },
                { "True", "False" },
                { "TRUE", "FALSE" },
                { "0",    "1" },
            },
        })
        vim.keymap.set('n', "U", vim.cmd.ToggleAlternate)
    end
}
