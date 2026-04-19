vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.hl.on_yank()
    end,
})

local cpp_group = vim.api.nvim_create_augroup("CppTemplates", { clear = true })
vim.api.nvim_create_autocmd("BufNewFile", {

    group = cpp_group,
    pattern = "*.cpp",

    callback = function()
        local snippet = vim.fn.expand("~/Snippets/snippet.cpp")
        if vim.fn.filereadable(snippet) == 1 then
            vim.cmd("0r " .. snippet)
        end
    end,
    desc = "Auto-load template for new C++ files",
})

local habit_group = vim.api.nvim_create_augroup("HabitSortGroup", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    group = habit_group,
    pattern = "*/todos.md",
    callback = function()
        local line_count = vim.api.nvim_buf_line_count(0)

        if line_count > 0 then
            vim.cmd("silent! %sort")
        end
    end,
    desc = "Auto-sort tasks in todos.md on save",
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        local clients = vim.lsp.get_clients({ bufnr = 0 })
        for _, client in pairs(clients) do
            if client:supports_method("textDocument/formatting") then
                vim.lsp.buf.format({ async = false })
                return
            end
        end
    end,
    desc = "Format on save via LSP",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "make",
    callback = function()
        vim.opt_local.expandtab = false
        vim.opt_local.tabstop = 8
        vim.opt_local.shiftwidth = 8
    end,
})


vim.api.nvim_create_autocmd("FileType", {
    pattern = { "python", "cpp", "c", "rust", "tex" },
    callback = function(args)
        local lang = vim.bo[args.buf].filetype
        local is_installed = pcall(vim.treesitter.get_parser, args.buf, lang)
        if is_installed then
            pcall(vim.treesitter.start)
        end
    end,
})
