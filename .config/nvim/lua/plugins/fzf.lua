local picker = require "fzf-lua"
picker.setup({
    fzf_opts = {
        ["--layout"] = "default",
        ["--cycle"] = true
    },
    files    = { hidden = false },
    winopts  = {
        fullscreen = true,
        border = "single",
        preview = {
            border     = "single",
            layout     = "vertical",
            horizontal = "right:60%",
            vertical   = "up:45%",
        },
    },
})
vim.keymap.set('n', '<leader>fb', picker.buffers)
vim.keymap.set('n', '<leader>fg', picker.live_grep)
vim.keymap.set('n', '<leader>fh', picker.help_tags)
vim.keymap.set('n', '<leader>fr', picker.oldfiles)
vim.keymap.set('n', '<leader>fm', picker.marks)

vim.keymap.set('n', '<leader>s', picker.lsp_document_symbols)
vim.keymap.set('n', '<leader><space>', picker.builtin)


local function files_up(cwd, query)
    cwd = cwd or vim.fn.getcwd()
    require("fzf-lua").files({
        cwd = cwd,
        query = query,
        actions = {
            ["ctrl-h"] = function()
                local last = require("fzf-lua").config.__resume_data.last_query
                files_up(vim.fn.fnamemodify(cwd, ":h"), last)
            end,
            ["ctrl-r"] = function()
                local last = require("fzf-lua").config.__resume_data.last_query
                files_up(vim.fn.expand("%:p:h"), last)
            end,
        },
    })
end

vim.keymap.set("n", "<leader>ff", function() files_up() end)
vim.keymap.set('n', '<leader>fw', function() picker.files({ cwd = "$NB_DIR" }) end)
vim.keymap.set('n', '<leader>fd', function() picker.files({ cwd = "$HOME" }) end)
