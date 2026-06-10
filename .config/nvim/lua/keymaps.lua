-- ~/.config/nvim/lua/keymaps.lua

vim.g.mapleader = " "
local keymap = vim.keymap.set

-- Utilities
keymap({ "n", "x" }, "<Space>", "<Nop>")
keymap("n", "<Esc>", function()
    vim.cmd("nohlsearch")
    vim.cmd("update")
end)

keymap("x", "<CR>", 'd"_cc')
keymap("n", "<CR>", function()
    return vim.bo.buftype == "nofile" and "<CR>" or "o<Esc>"
end, { expr = true, replace_keycodes = true })

keymap("t", "<C-x>", "<C-\\><C-n>")
keymap("t", "<C-w>", "<C-\\><C-n><C-w>")

keymap("n", "<C-j>", "gj")
keymap("n", "<C-k>", "gk")

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

keymap("n", "gl", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

keymap("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "toggle undotree" })

-- CodeRunner
keymap("n", "<leader>r", function()
    vim.cmd("write")
    vim.cmd("RunCode")
end)
keymap("n", "<leader>t", [[<leader>r<C-\><C-n>"api<CR><C-w><C-w>]], { remap = true })

-- Smart print
local function smart_print()
    local ft = vim.bo.filetype
    local templates = {
        rust       = 'println!("");<Esc>2hi',
        python     = 'print()<left>',
        lua        = 'print()<left>',
        javascript = 'console.log()<left>',
        go         = 'fmt.Println()<left>',
        c          = [[printf("\n");<Esc>4hi]],
        -- cpp        = [[printf("\n");<Esc>4hi]],
        cpp        = 'cout <<  << endl;<Esc>8hi',
    }
    return templates[ft] or 'print()<Left>'
end
keymap('i', '<C-j>', smart_print, { expr = true })

local my_themes = { "carbonfox", "tokyonight-night" }
local current_theme_idx = 1
local function cycle_colorscheme()
    current_theme_idx = current_theme_idx % #my_themes + 1
    local next_theme = my_themes[current_theme_idx]
    pcall(vim.cmd.colorscheme, next_theme)
end
keymap({ "n", "i" }, "<F8>", cycle_colorscheme)
