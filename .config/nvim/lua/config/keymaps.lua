vim.g.mapleader = " "
vim.g.maplocalleader = " "
local keymap = vim.keymap.set

-- [[ KEYMAPS ]]
keymap({ 'n', 'x' }, "<Space>", "<Nop>")
keymap('x', "<Tab>", "g_")
keymap('n', "<leader>m", "m")
keymap('i', "<C-c>", "<Esc>")
keymap('n', "<Esc>", function()
    vim.cmd("nohlsearch")
    vim.cmd("update")
end)

keymap('x', "<CR>", 'd"_cc')
keymap('n', "<CR>", function()
    return vim.bo.buftype == "nofile" and "<CR>" or "o<Esc>"
end, { expr = true })

keymap('n', "R", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]])
keymap('x', "R", [[y:%s/\V<C-R>=escape(@", '/\')<CR>//gI<Left><Left><Left>]])

keymap('t', "<C-x>", [[<C-\><C-n>]])
keymap('t', "<C-w>", [[<C-\><C-n><C-w>]])

keymap('n', "<C-j>", "gj")
keymap('n', "<C-k>", "gk")

keymap('x', "<", "<gv")
keymap('x', ">", ">gv")

keymap('x', "<leader>p", '"_dP')
keymap('x', "<leader>c", '"_c')
keymap({ 'n', 'x' }, "<leader>x", '"_x')

keymap('n', "<S-l>", "<cmd>bnext<CR>")
keymap('n', "<S-h>", "<cmd>bprev<CR>")
keymap('n', "<S-m>", "<cmd>b#<CR>")

keymap({ 'x', 'o' }, 'il', ":<C-u>normal! ^vg_<CR>", { silent = true })
keymap({ 'x', 'o' }, 'ig', ":<C-u>normal! ggVG<CR><C-o>", { silent = true })

keymap('n', "gl", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

keymap('n', "<leader>c", function()
    if vim.fn.getqflist({ winid = 0 }).winid > 0 then
        vim.cmd.cclose()
    else
        vim.cmd.copen()
    end
end, { desc = "Toggle Quickfix Window" })

-- My textobject
for _, gd in ipairs({ 'i', 'a' }) do
    keymap('x', gd .. '}', "<Esc>/{<CR>v" .. gd .. "{", { silent = true })
    keymap('x', gd .. ')', "<Esc>/(<CR>v" .. gd .. "(", { silent = true })
    for _, op in ipairs({ 'y', 'c', 'd' }) do
        keymap('n', op .. gd .. '}', '/{<CR>' .. op .. gd .. '{', { silent = true })
        keymap('n', op .. gd .. ')', '/(<CR>' .. op .. gd .. '(', { silent = true })
    end
end

-- Smart print
local templates = {
    rust       = 'println!("");<Esc>2hi',
    python     = 'print()<left>',
    lua        = 'print()<left>',
    javascript = 'console.log()<left>',
    go         = 'fmt.Println()<left>',
    c          = [[printf("\n");<Esc>4hi]],
    cpp        = 'cout <<  << endl;<Esc>8hi',
    tex        = "$$<left>",
}
local function smart_print()
    local ft = vim.bo.filetype
    return templates[ft] or 'print()<Left>'
end
keymap('i', "<C-j>", smart_print, { expr = true })
