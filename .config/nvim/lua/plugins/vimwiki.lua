return {
    {
        "vimwiki/vimwiki",
        ft = { "vimwiki", "markdown" },
        init = function()
            vim.g.vimwiki_list = {
                {
                    path = "~/.nb/home/",
                    syntax = "markdown",
                    ext = ".md",
                },
            }
        end,
    },
}
