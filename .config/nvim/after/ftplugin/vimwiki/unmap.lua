-- Remove Vimwiki's hijacking of Tab
vim.keymap.del("n", "<Tab>", { buffer = true })
vim.keymap.del("n", "<S-Tab>", { buffer = true })
vim.keymap.set("n", "\\", "<Plug>VimwikiNextLink", { buffer = true, desc = "Vimwiki Next Link" })
vim.keymap.set("n", "|", "<Plug>VimwikiPrevLink", { buffer = true, desc = "Vimwiki Prev Link" })
