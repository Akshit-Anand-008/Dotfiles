return {
    "folke/flash.nvim",
    config = function()
        local foo = require "flash"
        foo.setup({ modes = { char = { enabled = false } } })
        vim.keymap.set({ "n", "x", "o" }, "m", function() foo.jump() end)
        vim.keymap.set({ "n", "x" }, "s", function()
            foo.jump({ search = { mode = function(str) return "\\<" .. str end, } })
        end)
        vim.keymap.set({ "n", "x", "o" }, "U", function() foo.treesitter() end)
        vim.keymap.set("o", "r", function() foo.remote() end)
        vim.keymap.set({ "x", "o" }, "R", function() foo.treesitter_search() end)
        vim.keymap.set("c", "<C-s>", function() foo.toggle() end)
    end
}
