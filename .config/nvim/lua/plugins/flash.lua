return {
    "folke/flash.nvim",
    config = function()
        require("flash").setup({
            modes = {
                search = { enabled = true },
                char = { jump_labels = true }
            }
        })
        local foo = require "flash"
        vim.keymap.set({ "n", "o" }, "s", function() foo.jump() end)
        vim.keymap.set("i", "<C-f>", function() foo.jump() end)
        vim.keymap.set({ "n", "o" }, "S", function() foo.treesitter() end)
        vim.keymap.set("o", "r", function() foo.remote() end)
        vim.keymap.set({ "x", "o" }, "s", function() foo.treesitter_search() end)
        vim.keymap.set("c", "<C-f>", function() foo.toggle() end)
    end
}
