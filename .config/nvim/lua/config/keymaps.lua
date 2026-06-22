vim.g.mapleader = " "
vim.g.maplocalleader = ","
local keymap = vim.keymap.set

-- [[ KEYMAPS ]]
keymap({ "n", "x" }, "<Space>", "<Nop>")
keymap("x", "<Tab>", "g_")
keymap("i", "<C-c>", "<Esc>")
keymap("n", "<Esc>", function()
    vim.cmd("nohlsearch")
    vim.cmd("update")
end)

keymap("x", "<CR>", 'd"_cc')
keymap("n", "<CR>", function()
    return vim.bo.buftype == "nofile" and "<CR>" or "o<Esc>"
end, { expr = true, replace_keycodes = true })

keymap("t", "<C-x>", [[<C-\><C-n>]])
keymap("t", "<C-w>", [[<C-\><C-n><C-w>]])

keymap("n", "<C-j>", "gj")
keymap("n", "<C-k>", "gk")

keymap("x", "<", "<gv")
keymap("x", ">", ">gv")

keymap("x", "<leader>p", '"_dP')
keymap("x", "<leader>c", '"_c')
keymap({ "n", "x" }, "<leader>x", '"_x')

keymap({ "x", "o" }, "il", ":<C-u>normal! ^vg_<CR>", { silent = true })
keymap({ "x", "o" }, 'ib', "in)", { remap = true })
keymap({ "x", "o" }, 'iB', "in}", { remap = true })

keymap("n", "<S-l>", "<cmd>bnext<CR>")
keymap("n", "<S-h>", "<cmd>bprev<CR>")
keymap("n", "<S-m>", "<cmd>b#<CR>")

keymap("n", "gl", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

keymap("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "toggle undotree" })

keymap("n", "<leader>r", function()
    vim.cmd("write")
    vim.cmd("RunCode")
end, { desc = "Code_Runner" })
keymap("n", "<leader>t", [[<leader>r<C-\><C-n>"api<CR><C-w><C-w>]], { remap = true })

keymap("n", "<leader>c", function()
    local qf_exists = false
    for _, win in ipairs(vim.fn.getwininfo()) do
        if win.quickfix == 1 then
            qf_exists = true
            break
        end
    end
    if qf_exists then
        vim.cmd("cclose")
    else
        vim.cmd("copen")
    end
end, { desc = "Toggle Quickfix Window" })

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
