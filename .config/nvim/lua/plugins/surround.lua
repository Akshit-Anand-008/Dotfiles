return {
    "kylechui/nvim-surround",
    init = function()
        vim.g.nvim_surround_no_mappings = true;
    end,
    config = function()
        vim.keymap.set("n", "m", "<Plug>(nvim-surround-normal)")
        vim.keymap.set("x", "m", "<Plug>(nvim-surround-visual)")
        vim.keymap.set("n", "mm", "<Plug>(nvim-surround-normal-cur)")
        vim.keymap.set("n", "dm", "<Plug>(nvim-surround-delete)")
        vim.keymap.set("n", "cm", "<Plug>(nvim-surround-change)")
    end,
}
