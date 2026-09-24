--Spell Check
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "tex", "markdown" },
    callback = function()
        vim.opt_local.spelllang = "en_us"
        vim.opt_local.spell = true
        vim.opt_local.spellcapcheck = ""
        vim.keymap.set("i", "<C-s>", "<c-g>u<Esc>[s1z=`]a<c-g>u", { buf = 0 })
        vim.keymap.set({ "n", "x" }, "j", "gj", { buf = 0 })
        vim.keymap.set({ "n", "x" }, "k", "gk", { buf = 0 })
        pcall(vim.keymap.del, "i", "[", { buf = 0 })
    end,
})

-- Tab key default behaviour for some files
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "make", "tsv" },
    callback = function()
        vim.opt_local.expandtab = false
    end,
})

-- Calling treesitter
vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        local buf = args.buf
        local ft = vim.bo[buf].filetype
        local lang = vim.treesitter.language.get_lang(ft)
        if not lang then return end
        local ok_add = pcall(vim.treesitter.language.add, lang)
        if not ok_add then return end
        vim.schedule(function()
            if vim.api.nvim_buf_is_valid(buf) then
                pcall(vim.treesitter.start, buf, lang)
            end
        end)
    end
})

-- Higlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function() vim.highlight.on_yank() end,
})

-- Force options
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "*" },
    callback = function()
        vim.opt.formatoptions = {
            t = true, c = true, r = true, o = false, q = true, ["]"] = true, j = true,
        }
    end
})
