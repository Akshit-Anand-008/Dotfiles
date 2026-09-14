vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,localoptions"
require("auto-session").setup({
    auto_save = true,
    args_allow_files_auto_save = true,
    args_allow_single_directory = true,
    suppressed_dirs = { "~/" },
})
