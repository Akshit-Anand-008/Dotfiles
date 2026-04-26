-- ~/.config/nvim/lua/keymaps.lua

vim.g.mapleader = " "
vim.g.maplocalleader = " "
local keymap = vim.keymap.set

-- Utility
keymap({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>")

keymap("n", "s", "o<Esc>", { noremap = true, silent = true })
keymap("n", "S", "O<Esc>", { noremap = true, silent = true })

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
local modes = { "n", "t" }
for _, mode in ipairs(modes) do
    keymap(mode, "<C-h>", [[<C-\><C-n><C-w>h]])
    keymap(mode, "<C-j>", [[<C-\><C-n><C-w>j]])
    keymap(mode, "<C-k>", [[<C-\><C-n><C-w>k]])
    keymap(mode, "<C-l>", [[<C-\><C-n><C-w>l]])
    keymap(mode, "<C-z>", [[<C-\><C-n><C-w>q]])
end

keymap("n", "<leader>sv", "<cmd>vsplit<CR>")
keymap("n", "<leader>sh", "<cmd>split<CR>")
keymap("n", "<leader>st", "<cmd>vsplit | term<CR>")
keymap("t", "<C-x>", [[<C-\><C-n>]])
keymap("n", "<C-Up>", ":resize +2<CR>", { silent = true })
keymap("n", "<C-Down>", ":resize -2<CR>", { silent = true })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { silent = true })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { silent = true })

-- Buffers
keymap("n", "<S-l>", "<cmd>w | bnext<CR>")
keymap("n", "<S-h>", "<cmd>w | bprev<CR>")
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
keymap("n", "<leader>d", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

-- Move lines (Alt + j/k)
keymap("n", "<A-j>", ":m .+1<CR>==")
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap("n", "<A-k>", ":m .-2<CR>==")
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Quickfix
keymap("n", "]q", "<cmd>cnext<CR>")
keymap("n", "[q", "<cmd>cprev<CR>")
keymap("n", "<leader>qo", "<cmd>copen<CR>")
keymap("n", "<leader>qc", "<cmd>cclose<CR>")

-- Functions
-- Copy full path file
keymap("n", "<leader>yp", function()
    local path = vim.fn.expand("%:~")
    vim.fn.setreg("+", path)
    vim.notify('Yanked: "' .. path .. '"')
end, { desc = "Copy absolute path" })

-- Unified Telescope Finder
keymap('n', '<leader>ff', function() require("telescope.builtin").find_files() end, { desc = 'Find Files' })
keymap('n', '<leader>fb', function() require("telescope.builtin").buffers() end, { desc = 'Find Buffers' })
keymap('n', '<leader>fg', function() require("telescope.builtin").live_grep() end, { desc = 'Live Grep' })
keymap('n', '<leader>fw', function() require("telescope.builtin").find_files({ cwd = "~/vimwiki" }) end)
keymap('n', '<leader>fh', function() require("telescope.builtin").find_files({ cwd = vim.fn.expand("~") }) end)

keymap("n", "<leader>fm", function()
    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local conf = require("telescope.config").values
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")
    local options = {
        "1. Open Buffers",
        "2. Recent Files",
        "3. Find Files (Current Dir)",
        "4. Find Files (From Home Directory)",
        "5. Find Wiki File (By Name)",
        "6. Search inside Wiki (Text Grep)",
    }
    pickers
        .new({}, {
            prompt_title = "Select Finder",
            finder = finders.new_table({

                results = options,

            }),
            sorter = conf.generic_sorter({}),
            attach_mappings = function(prompt_bufnr, _)
                actions.select_default:replace(function()
                    actions.close(prompt_bufnr)

                    local selection = action_state.get_selected_entry()
                    local choice = selection[1]
                    if choice == options[1] then
                        require("telescope.builtin").buffers()
                    elseif choice == options[2] then
                        require("telescope.builtin").oldfiles()
                    elseif choice == options[3] then
                        require("telescope.builtin").find_files()
                    elseif choice == options[4] then
                        require("telescope.builtin").find_files({ cwd = vim.fn.expand("$HOME") })
                    elseif choice == options[5] then
                        require("telescope.builtin").find_files({ cwd = "~/vimwiki" })
                    elseif choice == options[6] then
                        require("telescope.builtin").live_grep({ cwd = "~/vimwiki" })
                    end
                end)
                return true
            end,
        })
        :find()
end, { desc = "Telescope Hub" })
