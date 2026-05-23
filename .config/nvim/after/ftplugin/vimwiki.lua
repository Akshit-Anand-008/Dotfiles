-- Remove Vimwiki's hijacking of Tab
-- Defer the deletion to ensure Vimwiki has actually set the maps first
vim.schedule(function()
    -- Use pcall (protect call) to prevent errors if the mappings genuinely aren't there
    pcall(vim.keymap.del, "n", "<Tab>", { buffer = true })
    pcall(vim.keymap.del, "n", "<S-Tab>", { buffer = true })
end)

vim.keymap.set("n", "<C-]>", "<Plug>VimwikiNextLink", { buffer = true, desc = "Vimwiki Next Link" })
vim.keymap.set("n", "<C-[>", "<Plug>VimwikiPrevLink", { buffer = true, desc = "Vimwiki Prev Link" })
