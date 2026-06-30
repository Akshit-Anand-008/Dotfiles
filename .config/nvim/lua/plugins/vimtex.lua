return {
    "lervag/vimtex",
    lazy = false,
    init = function()
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_quickfix_autoclose_after_keystrokes = 1
        vim.g.vimtex_view_forward_search_on_start = false
        -- vim.g.vimtex_compiler_latexmk = {
        --     aux_dir = "/home/akshit_anand/.texfiles/",
        --     out_dir = "/home/akshit_anand/LaTeXPDFs/",
        --     options = { "-synctex=0" }
        -- }
    end
}
