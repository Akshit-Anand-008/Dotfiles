vim.g.nvim_surround_no_mappings = true;
vim.keymap.set("n", "S", "<Plug>(nvim-surround-normal)")
vim.keymap.set("x", "S", "<Plug>(nvim-surround-visual)")
vim.keymap.set("n", "SS", "<Plug>(nvim-surround-normal-cur)")
vim.keymap.set("n", "dS", "<Plug>(nvim-surround-delete)")
vim.keymap.set("n", "cS", "<Plug>(nvim-surround-change)")
