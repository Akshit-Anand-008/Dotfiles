-- ~/.config/nvim/lua/keymaps.lua

vim.g.mapleader = " "
vim.g.maplocalleader = " "
local keymap = vim.keymap.set

-- Utilities
keymap("n", "<Esc>", vim.cmd.nohlsearch)
keymap({ "n", "x" }, "<Space>", "<Nop>")
keymap("t", "<C-x>", "<C-\\><C-n>")
keymap("x", "s", 'd"_cc')

keymap("n", "<C-j>", "gj")
keymap("n", "<C-k>", "gk")

keymap("n", "s", "o<Esc>")
keymap("n", "S", "O<Esc>")

keymap("x", "<", "<gv")
keymap("x", ">", ">gv")

keymap("x", "<leader>p", '"_dP')
keymap("x", "<leader>c", '"_c')
keymap({ "n", "x" }, "<leader>x", '"_x')

keymap({ "o", "x" }, "il", ":<C-u>normal! ^vg_<CR>", { silent = true })
keymap("x", "ib", ":<C-u>normal! f(vi(<CR>", { silent = true })
keymap("x", "iB", ":<C-u>normal! f{vi{<CR>", { silent = true })
for _, op in ipairs({ "c", "d", "y" }) do
    keymap("n", op .. "ib", "f(" .. op .. "i(")
    keymap("n", op .. "iB", "f{" .. op .. "i{")
end

keymap("n", "<S-l>", "<cmd>bnext<CR>")
keymap("n", "<S-h>", "<cmd>bprev<CR>")
keymap("n", "<S-m>", "<cmd>b#<CR>")

-- Diagnostics
-- keymap("n", "]d", function() vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR }) end)
-- keymap("n", "[d", function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR }) end)
keymap("n", "gl", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
keymap("n", "<leader>l", "@@")

-- CodeRunner
keymap("n", "<leader>r", function()
    vim.cmd("write")
    vim.cmd("RunCode")
end)

keymap("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "toggle undotree" })
keymap("n", "<A-x>", "<Plug>VimwikiToggleListItem", { desc = "Toggle Checkbox" })

-- Smart print
local function smart_print()
    local ft = vim.bo.filetype
    local templates = {
        rust       = 'println!("");<Esc>2hi',
        python     = 'print()<left>',
        lua        = 'print()<left>',
        javascript = 'console.log()<left>',
        go         = 'fmt.Println()<left>',
        c          = 'printf("");<Esc>2hi',
        cpp        = 'cout <<  << endl;<Esc>8hi',
    }
    return templates[ft] or 'print()<Left>'
end
keymap('i', '<C-k>', smart_print, { expr = true })
