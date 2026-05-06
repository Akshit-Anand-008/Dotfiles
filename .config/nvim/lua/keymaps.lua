-- ~/.config/nvim/lua/keymaps.lua

vim.g.mapleader = " "
vim.g.maplocalleader = " "
local keymap = vim.keymap.set

-- Utility
keymap({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>")

keymap("n", "s", "o<Esc>k", { noremap = true, silent = true })
keymap("n", "S", "O<Esc>j", { noremap = true, silent = true })

keymap("v", "<", "<gv", { desc = "Indent left and reselect" })
keymap("v", ">", ">gv", { desc = "Indent right and reselect" })

keymap("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })
keymap({ "n", "v" }, "<leader>x", '"_x', { desc = "Delete without yanking" })

keymap("n", "<leader>v", "^vg_", { desc = "Select current line text" })
keymap("n", "=", "gg=G``", { buffer = true, silent = true })


-- Toggle plugins
keymap("n", "<leader>e", ":Neotree toggle<CR>")
keymap("n", "<leader>u", ":UndotreeToggle<CR>")
keymap("n", "<A-t>", "<Plug>VimwikiToggleListItem", { desc = "Toggle Checkbox" })

-- UNIVERSAL TERMINAL & SPLIT NAVIGATION
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

-- Save and run
keymap("n", "<leader>l", ":w | !!<CR>", { desc = "Save and repeat last shell command" })
keymap("n", "<leader>m", "@@", { desc = "Run last macro" })

keymap("n", "<leader>r", function()
    if vim.bo.buftype ~= "" or vim.fn.expand("%") == "" then
        print("Not a executable file")
        return
    end
    vim.cmd("write")
    vim.cmd("RunCode")
end, { desc = "Save and Run Code" })

-- Persistence
keymap("n", "<leader>ss", function()
    require("persistence").load()
end, { desc = "Restore Session" })
keymap("n", "<leader>sl", function()
    require("persistence").load({ last = true })
end, { desc = "Restore Last" })

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

-- Functions
-- Move lines (Alt + j/k)
keymap("n", "<A-j>", ":m .+1<CR>==")
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap("n", "<A-k>", ":m .-2<CR>==")
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Unified Telescope Finder
keymap('n', '<leader>ff', function() require("telescope.builtin").find_files() end, { desc = 'Find Files' })
keymap('n', '<leader>fb', function() require("telescope.builtin").buffers() end, { desc = 'Find Buffers' })
keymap('n', '<leader>fg', function() require("telescope.builtin").live_grep() end, { desc = 'Live Grep' })
keymap('n', '<leader>fn', function() require("telescope.builtin").find_files({ cwd = "~/.nb" }) end)
keymap('n', '<leader>fh', function() require("telescope.builtin").find_files({ cwd = vim.fn.expand("~") }) end)

-- Smart print
local function smart_print()
    local ft = vim.bo.filetype
    local templates = {
        rust       = 'println!("");<Esc>3hi',
        python     = 'print()<Left>',
        lua        = 'print()<Left>',
        javascript = 'console.log()<Left>',
        go         = 'fmt.Println()<Left>',
        c          = 'printf("");<Esc>3hi',
        cpp        = 'cout <<  << endl;<Esc>8hi',
    }
    return templates[ft] or 'print()<Left>'
end
vim.keymap.set('i', '<C-k>', smart_print, { expr = true })

--Useless Shit
keymap("n", "<A-p>", function()
    local path = vim.fn.expand("%:~")
    vim.fn.setreg("+", path)
    vim.notify('Yanked: "' .. path .. '"')
end, { desc = "Copy absolute path" })

keymap("n", "<A-c>", "<cmd>e ~/dotfiles/.config/nvim/lua/plugins/coderunner.lua<CR>", { desc = "open code_runner" })
keymap("n", "<A-s>", ":ASToggle<CR>", { desc = "toggle auto-save" })
