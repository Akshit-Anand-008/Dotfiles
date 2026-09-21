vim.g.mapleader = " "
vim.g.maplocalleader = " "
local keymap = vim.keymap.set

keymap({ 'n', 'x' }, "<Space>", "<Nop>")
keymap({ 'n', 'x' }, "<Tab>", "<Nop>")
keymap('n', "<C-i>", "<C-i>")
keymap('t', "<C-w>", [[<C-\><C-n>]])
keymap('i', "<C-c>", "<Esc>")
keymap('n', "<C-c>", "<cmd>bp|bd #<CR>")
keymap('i', "<C-l>", "<right>")
keymap('n', "<Esc>", function()
    vim.cmd.nohlsearch()
    vim.cmd.update()
end)

keymap('n', "<S-CR>", "O<Esc>")
keymap('n', "<CR>", function()
    return (vim.bo.buftype == "nofile") and "<CR>" or "o<Esc>"
end, { expr = true })

keymap('n', "R", [[:s/\<<C-r><C-w>\>//gI<Left><Left><Left>]])
keymap('n', "<C-S-r>", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]])
keymap('x', "R", [[y:s/\V<C-R>=escape(@", '/\')<CR>//gI<Left><Left><Left>]])
keymap('x', "<C-S-r>", [[y:%s/\V<C-R>=escape(@", '/\')<CR>//gI<Left><Left><Left>]])

keymap({ 'n', 'x' }, "<C-j>", "gj")
keymap({ 'n', 'x' }, "<C-k>", "gk")

keymap({ 'n', 'x', 'o' }, '^', '0')
keymap({ 'n', 'x', 'o' }, '_', '^')
keymap({ 'n', 'x', 'o' }, '-', 'g_')

keymap('x', "<", "<gv")
keymap('x', ">", ">gv")

keymap('n', "<S-l>", vim.cmd.bnext)
keymap('n', "<S-h>", vim.cmd.bprev)
keymap('n', "<S-m>", "<cmd>b#<CR>")

keymap({ 'x', 'o' }, 'il', ":<C-u>normal! ^vg_<CR>", { silent = true })
keymap({ 'x', 'o' }, 'ig', ":<C-u>normal! ggVG<CR>", { silent = true })

keymap('n', "gl", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

keymap('n', "<leader>c", function()
    if vim.fn.getqflist({ winid = 0 }).winid > 0 then vim.cmd.cclose() else vim.cmd.copen() end
end, { desc = "Toggle Quickfix Window" })

-- Smart print
local templates = {
    rust       = 'println!("");<Esc>2hi',
    python     = 'print()<left>',
    lua        = 'print()<left>',
    javascript = 'console.log()<left>',
    go         = 'fmt.Println()<left>',
    c          = [[printf("\n");<Esc>4hi]],
    -- cpp        = [[printf("\n");<Esc>4hi]],
    cpp        = 'std::cout <<  << std::endl;<Esc>13hi',
    tex        = '$$<left>',
    -- markdown   = '<!--  --><Esc>3hi',
    markdown   = '&nbsp;'
}
local function smart_print()
    local ft = vim.bo.filetype
    return templates[ft] and ("<C-g>u" .. templates[ft]) or ""
end
keymap('i', "<C-j>", smart_print, { expr = true })
