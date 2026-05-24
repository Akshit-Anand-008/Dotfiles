-- ~/.config/nvim/lua/keymaps.lua

vim.g.mapleader = " "
vim.g.maplocalleader = " "
local keymap = vim.keymap.set

-- Utilities
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>")
keymap({ "n", "v" }, "<Space>", "<Nop>")
keymap("n", "=", "gg=G<C-o>")

keymap("i", "<C-l>", "<right>")
keymap("i", "<C-h>", "<left>")

keymap("n", "s", "o<Esc>")
keymap("n", "S", "O<Esc>")

keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

keymap("v", "<leader>p", '"_dP')
keymap({ "n", "v" }, "<leader>x", '"_x')

keymap("n", "<leader>v", "^vg_")
keymap("n", "<leader>y", "^yg_")
keymap("n", "<leader>d", "^dg_")
keymap("n", "<leader>c", "^cg_")

keymap("n", "<S-l>", "<cmd>bnext<CR>")
keymap("n", "<S-h>", "<cmd>bprev<CR>")
keymap("n", "<S-m>", "<cmd>b#<CR>")

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
vim.keymap.set('i', '<C-k>', smart_print, { expr = true })

-- Diagnostics
keymap("n", "]d", function() vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR }) end)
keymap("n", "[d", function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR }) end)
keymap("n", "gl", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

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

-- Shortcuts
keymap("n", "<A-p>", function()
    local path = vim.fn.expand("%:~")
    vim.fn.setreg("+", path)
    vim.notify('Yanked: "' .. path .. '"')
end, { desc = "Copy path" })

keymap("n", "<A-x>", "<Plug>VimwikiToggleListItem", { desc = "Toggle Checkbox" })
keymap("n", "<A-s>", ":ASToggle<CR>", { desc = "Toggle auto-save" })
