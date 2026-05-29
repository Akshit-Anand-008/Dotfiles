-- Higlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function() vim.hl.on_yank() end,
})

--Auto loading templates
vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = { "*.cpp", "*.c", "*.tex", "*.v" },
    callback = function()
        local ext = vim.fn.expand("%:e")
        local snippet = vim.fn.expand("~/Snippets/snippet." .. ext)
        if vim.fn.filereadable(snippet) == 1 then
            vim.cmd("0r " .. snippet)
            vim.cmd("$delete")
            vim.cmd("normal! G")
        end
    end,
})

-- Tab key default behaviour for some files
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "make", "tsv" },
    callback = function()
        vim.opt_local.expandtab = false
        vim.opt_local.tabstop = 8
        vim.opt_local.shiftwidth = 8
    end,
})

-- vimwiki keymaps
-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = { "vimwiki" },
--     callback = function(args)
--         local bufnr = args.buf
--         vim.keymap.del("n", "<Tab>", { buffer = bufnr })
--         vim.keymap.del("n", "<S-Tab>", { buffer = bufnr })
--         vim.keymap.set("n", "<C-]>", "<Plug>VimwikiNextLink", { buffer = bufnr })
--         vim.keymap.set("n", "<C-[>", "<Plug>VimwikiPrevLink", { buffer = bufnr })
--     end
-- })

-- Auto-format on save
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', {}),
    callback = function(ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
        if client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
                buffer = ev.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = ev.buf, id = client.id })
                end,
            })
        end
    end,
})

-- Calling treesitter
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function(args)
        local buf = args.buf
        local ft = vim.bo[buf].filetype
        local lang = vim.treesitter.language.get_lang(ft)
        if not lang then return end
        local ok_add = pcall(vim.treesitter.language.add, lang)
        if not ok_add then return end
        pcall(vim.treesitter.start, buf, lang)
    end,
})

--Force options
vim.api.nvim_create_autocmd("FileType", {
    callback = function() vim.opt_local.formatoptions:remove({ "o", "c" }) end,
})
