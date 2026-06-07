-- Modules
require("options")
require("commands")
require("autocommands")
require("keymaps")

-- File types
vim.filetype.add({
    extension = { v = "systemverilog" }
})

-- Lazy-nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")
