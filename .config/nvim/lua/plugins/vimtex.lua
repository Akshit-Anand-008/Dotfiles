vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_quickfix_autoclose_after_keystrokes = 1
vim.g.vimtex_view_forward_search_on_start = false
vim.g.vimtex_quickfix_open_on_warning = 0
vim.g.vimtex_compiler_latexmk = {
    aux_dir = vim.fn.expand('$HOME/.texfiles'),
    out_dir = "texfiles/",
    options = { "-synctex=0" }
}
