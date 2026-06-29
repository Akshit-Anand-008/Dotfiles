--Spell Check
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "tex" },
    callback = function()
        vim.opt_local.spell = true
        vim.keymap.set("i", "<C-s>", "<c-g>u<Esc>[S1z=`]a<c-g>u", { buf = 0 })
        -- vim.opt_local.spelllang = "en_us"
        -- vim.opt_local.spellcapcheck = ""
    end,
})

-- Tab key default behaviour for some files
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "make", "tsv" },
    callback = function()
        vim.opt_local.expandtab = false
        vim.opt_local.shiftwidth = 8
    end,
})

--Auto loading templates
vim.api.nvim_create_autocmd("BufNewFile", {
    callback = function()
        local ext = vim.fn.expand("%:e")
        local snippet = vim.fn.expand("~/Snippets/snippet." .. ext)
        if vim.fn.filereadable(snippet) == 1 then
            vim.cmd("0r " .. snippet)
            vim.cmd("normal! G")
            vim.cmd('normal! "_dd')
        end
    end,
})

-- Higlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function() vim.highlight.on_yank() end,
})

--Force options
vim.api.nvim_create_autocmd("FileType", {
    callback = function() vim.opt_local.formatoptions:remove({ "o", "c" }) end,
})
