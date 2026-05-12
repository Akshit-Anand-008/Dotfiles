return {
    "vimwiki/vimwiki",
    init = function()
        vim.g.vimwiki_list = { {
            path = "~/NoteBooks/Wiki/",
            syntax = "markdown",
            ext = ".md",
        }, }
    end,
}
