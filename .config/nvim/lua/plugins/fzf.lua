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

local function files_up(cwd, query, hidden)
    cwd = cwd or vim.fn.getcwd()
    local fzf = require("fzf-lua")
    local function last_query() return fzf.config.__resume_data.last_query end

    fzf.files({
        cwd = cwd,
        query = query,
        hidden = hidden,
        actions = {
            ["ctrl-h"] = function()
                files_up(vim.fn.fnamemodify(cwd, ":h"), last_query(), hidden)
            end,
            ["ctrl-r"] = function()
                files_up(vim.fn.expand("%:p:h"), last_query(), hidden)
            end,
            ["ctrl-a"] = function()
                files_up(cwd, last_query(), not hidden)
            end,
        },
    })
end

vim.keymap.set("n", "<leader>ff", function() files_up() end)
vim.keymap.set('n', "<leader>ff", function() files_up() end)
vim.keymap.set('n', "<C-P>", function() files_up() end)
vim.keymap.set('n', '<leader>fw', function() picker.files({ cwd = "$NB_DIR" }) end)
vim.keymap.set('n', '<leader>fd', function() picker.files({ cwd = "$HOME" }) end)
