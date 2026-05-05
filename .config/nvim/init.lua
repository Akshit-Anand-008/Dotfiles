--  Basic Settings & Globals --
require("options")
require("autocommands")
require("keymaps")

--  Lazy.nvim Bootstrap ]] --
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

-- Diagnostics
local notify_handler = vim.lsp.handlers["textDocument/publishDiagnostics"]
vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
    local filtered_diagnostics = {}
    for _, diagnostic in ipairs(result.diagnostics) do
        if diagnostic.severity < 3 then
            table.insert(filtered_diagnostics, diagnostic)
        end
    end
    result.diagnostics = filtered_diagnostics
    notify_handler(err, result, ctx, config)
end
vim.diagnostic.config({
    virtual_text = { severity = vim.diagnostic.severity.ERROR, wrap = true },
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})
vim.lsp.enable('rust_analyzer')
