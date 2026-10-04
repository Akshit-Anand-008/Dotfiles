local foo = require "flash"
foo.setup({})
vim.keymap.set({ "n", "x", "o" }, "s", function() foo.jump() end)
vim.keymap.set("o", "r", function() foo.remote() end)
vim.keymap.set("c", "<C-s>", function() foo.toggle() end)
