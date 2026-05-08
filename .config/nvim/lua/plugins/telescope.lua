return {
    "nvim-telescope/telescope.nvim",
    version = '*',
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        local telescope = require("telescope")
        require("custom.smart-grep").setup()
        telescope.setup({})
        telescope.load_extension("fzf")
        local builtin = require("telescope.builtin")

        vim.keymap.set('n', '<leader>ft', "<cmd>Telescope builtin<CR>")
        vim.keymap.set('n', '<leader>ff', function() builtin.find_files() end)
        vim.keymap.set('n', '<leader>fb', function() builtin.buffers() end)
        vim.keymap.set('n', '<leader>fg', function() builtin.live_grep() end)
        vim.keymap.set('n', '<leader>fw', function() builtin.find_files({ cwd = "~/.nb" }) end)
        vim.keymap.set('n', '<leader>fh', function() builtin.help_tags() end)
        vim.keymap.set("n", "<leader>fr", function() builtin.oldfiles() end)

        vim.keymap.set("n", "<leader>fm", function()
            local pickers = require("telescope.pickers")
            local finders = require("telescope.finders")
            local conf = require("telescope.config").values
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")
            local commands = {
                ["1. (Grep)  Current Dir "]      = function() builtin.live_grep({ cwd = vim.fn.expand("%:p:h") }) end,
                ["2. (Grep)  Parent Dir "]       = function() builtin.live_grep({ cwd = vim.fn.expand("%:p:h:h") }) end,
                ["3. (Grep)  Home Dir"]          = function() builtin.live_grep({ cwd = "~/.nb/home" }) end,
                ["4. (Grep)  Wiki "]             = function() builtin.live_grep({ cwd = "~/.nb/home" }) end,
                ["5. (Files) Current Dir "]      = function() builtin.find_files({ cwd = vim.fn.expand("%:p:h") }) end,
                ["6. (Files) Parent directory "] = function() builtin.find_files({ cwd = vim.fn.expand("%:p:h:h") }) end,
                ["7. (Files) Home "]             = function() builtin.find_files({ cwd = vim.fn.expand("~") }) end,
            }
            local options = {}
            for k, _ in pairs(commands) do table.insert(options, k) end
            table.sort(options)
            pickers.new({}, {
                prompt_title = "Telescope Hub",
                finder = finders.new_table({
                    results = options,
                }),
                sorter = conf.generic_sorter({}),
                attach_mappings = function(prompt_bufnr, _)
                    actions.select_default:replace(function()
                        local selection = action_state.get_selected_entry()
                        actions.close(prompt_bufnr)
                        local choice = selection[1]
                        if commands[choice] then
                            commands[choice]()
                        end
                    end)
                    return true
                end,
            }):find()
        end, { desc = "Telescope Hub" })
    end,
}
