return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },

    config = function()
        require("telescope").setup({
            defaults = {
                path_display = { "truncate" },
                layout_strategy = "vertical",
                layout_config = {
                    height = 0.9,
                    width = 0.9,
                    preview_cutoff = 0,
                    preview_height = 0.3
                },
            },
            extensions = { fzf = {} }
        })
        require('telescope').load_extension('fzf')
        local builtin = require "telescope.builtin"
        require "custom.fileseek"

        -- Key maps
        vim.keymap.set('n', '<leader>fd', builtin.builtin)
        vim.keymap.set('n', '<leader>fb', builtin.buffers)
        vim.keymap.set('n', '<leader>fg', builtin.live_grep)
        vim.keymap.set('n', '<leader>fl', builtin.find_files)
        vim.keymap.set('n', '<leader>fh', builtin.help_tags)
        vim.keymap.set('n', '<leader>fr', builtin.oldfiles)
        vim.keymap.set('n', '<leader>fm', builtin.marks)
        vim.keymap.set('n', 'S', builtin.lsp_document_symbols)
    end,
}
