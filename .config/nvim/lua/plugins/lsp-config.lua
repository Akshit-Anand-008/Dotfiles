return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        { "williamboman/mason.nvim", opts = {} },
        { "neovim/nvim-lspconfig" },
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
    end
}
