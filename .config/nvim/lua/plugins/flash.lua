return {
    "folke/flash.nvim",
    config = function()
        local foo = require "flash"
        foo.setup({ modes = { char = { enabled = false } } })
        vim.keymap.set({ "n", "x", "o" }, "s", function() foo.jump() end)
        -- vim.keymap.set({ "n", "x", "o" }, "S", function()
        --     foo.jump({ search = { mode = function(str) return "\\<" .. str end, } })
        -- end)
        vim.keymap.set("n", "U", function() foo.treesitter() end)
        vim.keymap.set("o", "r", function() foo.remote() end)
        vim.keymap.set({ "x", "o" }, "R", function() foo.treesitter_search() end)
        vim.keymap.set("c", "<C-s>", function() foo.toggle() end)
    end
}
