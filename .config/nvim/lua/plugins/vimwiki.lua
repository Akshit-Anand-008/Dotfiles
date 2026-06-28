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
        vim.keymap.set('n', '<leader>W', '<cmd>VimwikiIndex 1<CR>', { silent = true })
        vim.keymap.set('n', '<leader>wi', '<cmd>VimwikiDiaryIndex 1<CR>', { silent = true })
        vim.keymap.set('n', '<leader>w<leader>w', '<cmd>VimwikiMakeDiaryNote 1<CR>', { silent = true })
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "vimwiki" },
            callback = function(args)
                pcall(vim.keymap.del, { "x", "o" }, "il", { buf = 0 })
                vim.keymap.set("n", "<A-x>", "<Plug>VimwikiToggleListItem", { buf = 0 })
                pcall(vim.keymap.del, "n", "<CR>", { buf = 0 })
                vim.keymap.set("n", "<leader><leader>", "<Plug>VimwikiNormalizeLinkVisualCR", { buf = 0 })
                vim.keymap.set("n", "<leader><leader>", "<Plug>VimwikiFollowLink", { buf = 0 })
                vim.keymap.set("n", "U", function() vim.cmd('normal! di["_diWP') end, { buf = 0 })
            end
        })
    end
}
