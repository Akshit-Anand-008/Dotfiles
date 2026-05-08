-- ~/.config/nvim/lua/keymaps.lua

vim.g.mapleader = " "
vim.g.maplocalleader = " "
local keymap = vim.keymap.set

-- Utilities
keymap({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
keymap("n", "<C-i>", "<cmd>b#<CR>", { desc = "Switch to last buffer" })
keymap("n", "<leader>l", ":w<CR>:<Up><CR>", { desc = "Save and repeat last command" })
keymap("n", "<leader>q", "@@", { desc = "Run last macro" })
keymap("n", "<leader>m", "<cmd>marks<CR>", { desc = "Open marks" })
keymap("n", "=", "gg=G``", { buffer = true, silent = true })

keymap("n", "s", "o<Esc>k", { noremap = true, silent = true })
keymap("n", "S", "O<Esc>j", { noremap = true, silent = true })

keymap("v", "<", "<gv", { desc = "Indent left and reselect" })
keymap("v", ">", ">gv", { desc = "Indent right and reselect" })

keymap("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })
keymap({ "n", "v" }, "<leader>x", '"_x', { desc = "Delete without yanking" })
keymap("n", "<leader>v", "^vg_", { desc = "Select current line text" })

-- Split navigation
keymap({ "n", "t" }, "<C-h>", [[<C-\><C-n><C-w>h]])
keymap({ "n", "t" }, "<C-j>", [[<C-\><C-n><C-w>j]])
keymap({ "n", "t" }, "<C-k>", [[<C-\><C-n><C-w>k]])
keymap({ "n", "t" }, "<C-l>", [[<C-\><C-n><C-w>l]])
keymap({ "n", "t" }, "<C-z>", [[<C-\><C-n><C-w>q]])
keymap("t", "<C-x>", [[<C-\><C-n>]])

keymap("n", "<leader>sv", "<cmd>vsplit<CR>")
keymap("n", "<leader>sh", "<cmd>split<CR>")
keymap("n", "<leader>st", "<cmd>vsplit | term<CR>")

keymap("n", "<C-Up>", ":resize +2<CR>", { silent = true })
keymap("n", "<C-Down>", ":resize -2<CR>", { silent = true })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { silent = true })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { silent = true })

-- Buffers
keymap("n", "<S-l>", "<cmd>bnext<CR>")
keymap("n", "<S-h>", "<cmd>bprev<CR>")
keymap("n", "<C-n>", ":e ")
keymap("n", "<leader>bd", "<cmd>bdelete<CR>")

-- Smart print
local function smart_print()
    local ft = vim.bo.filetype
    local templates = {
        rust       = 'println!("");<Esc>2hi',
        python     = 'print()<Left>',
        lua        = 'print()<Left>',
        javascript = 'console.log()<Left>',
        go         = 'fmt.Println()<Left>',
        c          = 'printf("");<Esc>2hi',
        cpp        = 'cout <<  << endl;<Esc>8hi',
    }
    return templates[ft] or 'print()<Left>'
end
vim.keymap.set('i', '<C-k>', smart_print, { expr = true })

-- Diagnostics
keymap("n", "]d", function()
    vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
end, { desc = "Next Diagnostic" })
keymap("n", "[d", function()
    vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR })
end, { desc = "Prev Diagnostic" })
keymap("n", "gl", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

-- Quickfix
keymap("n", "]q", "<cmd>cnext<CR>")
keymap("n", "[q", "<cmd>cprev<CR>")
keymap("n", "<leader>qo", "<cmd>copen<CR>")
keymap("n", "<leader>qc", "<cmd>cclose<CR>")

-- CodeRunner
keymap("n", "<leader>r", function()
    if vim.bo.buftype ~= "" or vim.fn.expand("%") == "" then
        print("Not a executable file")
        return
    end
    vim.cmd("write")
    vim.cmd("RunCode")
end, { desc = "Save and Run Code" })

-- UndoTree
keymap("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "toggle undotree" })

---- Shortcuts ----
keymap("n", "<A-p>", function()
    local path = vim.fn.expand("%:~")
    vim.fn.setreg("+", path)
    vim.notify('Yanked: "' .. path .. '"')
end, { desc = "Copy absolute path" })

keymap("n", "<A-t>", "<Plug>VimwikiToggleListItem", { desc = "Toggle Checkbox" })
keymap("n", "<A-s>", ":ASToggle<CR>", { desc = "toggle auto-save" })
