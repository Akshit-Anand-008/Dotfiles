return {
    "vimwiki/vimwiki",
    init = function()
        vim.g.vimwiki_list = { {
            path = vim.fn.expand("$WIKI_PATH"),
            syntax = "markdown",
            ext = ".md",
        }, }
    end,
    config = function()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "vimwiki" },
            callback = function(args)
                local bufnr = args.buf
                -- pcall(vim.keymap.del, "n", "<Tab>", { buffer = bufnr })
                -- pcall(vim.keymap.del, "n", "<S-Tab>", { buffer = bufnr })
                pcall(vim.keymap.del, "o", "il", { buffer = bufnr })
                vim.keymap.set("n", "<A-x>", "<Plug>VimwikiToggleListItem")
                -- vim.keymap.set("n", "<C-]>", "<Plug>VimwikiNextLink", { buffer = bufnr })
                -- vim.keymap.set("n", "<C-[>", "<Plug>VimwikiPrevLink", { buffer = bufnr })
            end
        })
    end
}
