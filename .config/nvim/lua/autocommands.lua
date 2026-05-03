-- Higlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.hl.on_yank()
    end,
})

--Auto loading templates
local template_group = vim.api.nvim_create_augroup("CodeTemplates", { clear = true })
vim.api.nvim_create_autocmd("BufNewFile", {
    group = template_group,
    pattern = { "*.cpp", "*.c" },
    callback = function()
        local ext = vim.fn.expand("%:e")
        local snippet = vim.fn.expand("~/Snippets/snippet." .. ext)
        if vim.fn.filereadable(snippet) == 1 then
            vim.cmd("0r " .. snippet)
            vim.cmd("$delete")
            vim.cmd("normal! G")
        end
    end,
    desc = "Auto-load template for new files",
})

--Sorting completed and not completed tasks in vimwiki
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

-- AutoFormat on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        vim.lsp.buf.format({ bufnr = args.buf, async = false })
    end,
    desc = "Format on save via LSP",
})

-- Tab key default behaviour for some files
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "make", "tsv" },
    callback = function()
        vim.opt_local.expandtab = false
        vim.opt_local.tabstop = 8
        vim.opt_local.shiftwidth = 8
    end,
})

-- Calling treesitter
vim.api.nvim_create_autocmd({ "FileType", "BufReadPost", "BufNewFile" }, {
    group = vim.api.nvim_create_augroup("TreesitterForceStart", { clear = true }),
    pattern = "*",
    callback = function(args)
        local lang = vim.bo[args.buf].filetype
        local has_parser = pcall(vim.treesitter.get_parser, args.buf, lang)
        if has_parser then
            vim.schedule(function()
                if vim.api.nvim_buf_is_valid(args.buf) then
                    pcall(vim.treesitter.start, args.buf, lang)
                end
            end)
        end
    end,
})

--Force options
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove({ "o", "c" })
    end,
})
