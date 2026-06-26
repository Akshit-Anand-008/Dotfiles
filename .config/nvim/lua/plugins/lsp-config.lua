return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        { "neovim/nvim-lspconfig" },
        { "folke/lazydev.nvim",      opts = {} },
        { "williamboman/mason.nvim", opts = {} },
    },
    config = function()
        require("mason-lspconfig").setup({})

        local notify_handler = vim.lsp.handlers["textDocument/publishDiagnostics"]
        vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
            local filtered_diagnostics = {}
            for _, diagnostic in ipairs(result.diagnostics) do
                if diagnostic.severity < 3 then
                    table.insert(filtered_diagnostics, diagnostic)
                end
            end
            result.diagnostics = filtered_diagnostics
            notify_handler(err, result, ctx, config)
        end

        vim.diagnostic.config({
            virtual_text = { severity = vim.diagnostic.severity.ERROR, wrap = true },
            underline = true,
            update_in_insert = false,
            severity_sort = true,
        })

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('my.lsp', {}),
            callback = function(ev)
                local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
                if client:supports_method('textDocument/formatting') then
                    vim.api.nvim_create_autocmd('BufWritePre', {
                        group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
                        buffer = ev.buf,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = ev.buf, id = client.id })
                        end,
                    })
                end
            end
        })
    end
}
