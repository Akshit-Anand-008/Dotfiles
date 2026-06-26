return {
    "folke/flash.nvim",
    config = function()
        local foo = require "flash"
        foo.setup({ modes = { char = { enabled = false } } })
        vim.keymap.set({ "n", "x", "o" }, "s", function() foo.jump() end)
        vim.keymap.set({ "x", "o" }, "S", function() foo.treesitter() end)
        vim.keymap.set("o", "r", function() foo.remote() end)
        vim.keymap.set("c", "<C-s>", function() foo.toggle() end)
    end
}
