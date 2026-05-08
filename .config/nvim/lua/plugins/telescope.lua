return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },

    config = function()
        local telescope = require("telescope")
        telescope.setup({})
        telescope.load_extension("fzf")
        vim.keymap.set("n", "<leader>fm", function()
            local pickers = require("telescope.pickers")
            local finders = require("telescope.finders")
            local conf = require("telescope.config").values
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")
            local builtin = require("telescope.builtin")

            local commands = {
                ["1. Parent directory (Files)"] = function() builtin.find_files({ cwd = vim.fn.expand("%:p:h:h") }) end,
                ["2. Open Buffers (Files)"]     = function() builtin.buffers() end,
                ["3. Recent Files (Files)"]     = function() builtin.oldfiles() end,
                ["4. Current Dir (Files)"]      = function() builtin.find_files() end,
                ["5. Current Dir (Grep)"]       = function() builtin.live_grep() end,
                ["6. Home (Files)"]             = function() builtin.find_files({ cwd = vim.fn.expand("$HOME") }) end,
                ["7. Wiki (Files)"]             = function() builtin.find_files({ cwd = "~/.nb/home" }) end,
                ["8. Wiki (Grep)"]              = function() builtin.live_grep({ cwd = "~/.nb/home" }) end,
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
