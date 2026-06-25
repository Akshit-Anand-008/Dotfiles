return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
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
            end,
        })
    end
}
