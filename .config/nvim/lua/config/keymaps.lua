vim.g.mapleader = " "
vim.g.maplocalleader = " "
local keymap = vim.keymap.set

keymap({ 'n', 'x' }, "<Space>", "<Nop>")
keymap('t', "<C-q>", [[<C-\><C-n>]])
keymap('i', "<C-c>", "<Esc>")
keymap('i', "<C-l>", "<right>")
keymap({ 'n', 'i', 'x' }, "<C-x>", vim.cmd.wqall)
keymap({ 'n', 'i' }, "<C-z>", vim.cmd.undo)
keymap('n', "<Esc>", function()
    vim.cmd.nohlsearch()
    vim.cmd.update()
end)

keymap('n', "<S-CR>", "O<Esc>")
keymap('n', "<CR>", function()
    return (vim.bo.buftype == "nofile") and "<CR>" or "o<Esc>"
end, { expr = true })

keymap({ 'n', 'x' }, "j", function()
    return vim.v.count > 1 and "m'" .. vim.v.count .. "j" or "j"
end, { expr = true })
keymap({ 'n', 'x' }, "k", function()
    return vim.v.count > 1 and "m'" .. vim.v.count .. "k" or "k"
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

keymap('n', "L", vim.cmd.bnext)
keymap('n', "H", vim.cmd.bprev)
keymap('n', "M", "<cmd>b#<CR>")

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

-- Closing buffers in a smart way
keymap("n", "<C-c>", function()
    local current_buf = vim.api.nvim_get_current_buf()
    local listed_buffers = vim.tbl_filter(
        function(bufnr) return vim.bo[bufnr].buflisted end,
        vim.api.nvim_list_bufs()
    )
    local buf_count = #listed_buffers
    vim.cmd.wall()
    if vim.bo.filetype == "help" then
        vim.cmd.close()
    elseif buf_count <= 1 then
        if (#vim.fn.win_findbuf(current_buf) > 1) then
            vim.cmd.close()
        else
            vim.cmd.quit()
        end
    else
        vim.cmd.bprevious()
        vim.cmd("bdelete " .. current_buf)
    end
end)
