return {
    "vimwiki/vimwiki",
    init = function()
        vim.g.vimwiki_list = { {
            path = vim.fn.expand("$WIKI_PATH"),
            syntax = "markdown",
            ext = ".md",
        } }
        vim.g.vimwiki_global_ext = 1
    end,
    config = function()
        vim.keymap.set('n', '<leader>w1', '<cmd>VimwikiIndex 1<CR>', { silent = true })
        vim.keymap.set('n', '<leader>wi', '<cmd>VimwikiDiaryIndex 1<CR>', { silent = true })
        vim.keymap.set('n', '<leader>w<leader>w', '<cmd>VimwikiMakeDiaryNote 1<CR>', { silent = true })
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "vimwiki" },
            callback = function(args)
                pcall(vim.keymap.del, { "x", "o" }, "il", { buf = 0 })
                vim.keymap.set("n", "<A-x>", "<Plug>VimwikiToggleListItem", { buf = 0 })
            end
        })
    end
}
