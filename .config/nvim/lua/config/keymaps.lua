vim.g.mapleader = " "
vim.g.maplocalleader = " "
local keymap = vim.keymap.set

keymap({ 'n', 'x' }, "<Space>", "<Nop>")
keymap('x', "<Tab>", "g_")
keymap('n', "<leader>m", "m")
keymap('i', "<C-c>", "<Esc>")
keymap('t', "<C-w>", [[<C-\><C-n>]])
keymap('i', "<C-l>", "<right>")
keymap('n', "<Esc>", function()
    vim.cmd.nohlsearch()
    vim.cmd.update()
end)
keymap('n', "<CR>", function()
    if (vim.bo.buftype == "nofile") then
        return "<CR>"
    else
        return "o<Esc>"
    end
end, { expr = true })

keymap("n", "<leader>e", function()
    if (vim.bo.filetype == "netrw") then
        vim.cmd.bwipeout()
    else
        vim.cmd.Ex()
    end
end)

keymap('n', "R", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]])
keymap('x', "R", [[y:%s/\V<C-R>=escape(@", '/\')<CR>//gI<Left><Left><Left>]])

keymap('n', "<C-j>", "gj")
keymap('n', "<C-k>", "gk")

keymap('x', "<", "<gv")
keymap('x', ">", ">gv")

keymap('x', "<leader>p", '"_dP')
keymap('x', "<leader>c", '"_c')
keymap({ 'n', 'x' }, "<leader>x", '"_x')

keymap('n', "<S-l>", vim.cmd.bnext)
keymap('n', "<S-h>", vim.cmd.bprev)
keymap('n', "<S-m>", "<cmd>b#<CR>")

keymap({ 'x', 'o' }, 'il', ":<C-u>normal! ^vg_<CR>", { silent = true })
keymap({ 'x', 'o' }, 'ig', ":<C-u>normal! ggVG<CR>", { silent = true })

keymap('n', "gl", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

keymap('n', "<leader>c", function()
    if vim.fn.getqflist({ winid = 0 }).winid > 0 then
        vim.cmd.cclose()
    else
        vim.cmd.copen()
    end
end, { desc = "Toggle Quickfix Window" })

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
