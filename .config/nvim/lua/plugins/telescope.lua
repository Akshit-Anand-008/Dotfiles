return {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
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
            local options = {
                "1. Open Buffers",
                "2. Recent Files",
                "3. Find Files (Current Dir)",
                "4. Find Files (From Home Directory)",
                "5. Find Wiki File (By Name)",
                "6. Search inside Wiki (Text Grep)",
            }
            pickers.new({}, {
                prompt_title = "Telescope Hub",
                finder = finders.new_table({
                    results = options,
                }),
                sorter = conf.generic_sorter({}),
                attach_mappings = function(prompt_bufnr, _)
                    actions.select_default:replace(function()
                        actions.close(prompt_bufnr)
                        local selection = action_state.get_selected_entry()
                        local choice = selection[1]
                        if choice == options[1] then
                            require("telescope.builtin").buffers()
                        elseif choice == options[2] then
                            require("telescope.builtin").oldfiles()
                        elseif choice == options[3] then
                            require("telescope.builtin").find_files()
                        elseif choice == options[4] then
                            require("telescope.builtin").find_files({ cwd = vim.fn.expand("$HOME") })
                        elseif choice == options[5] then
                            require("telescope.builtin").find_files({ cwd = "~/vimwiki" })
                        elseif choice == options[6] then
                            require("telescope.builtin").live_grep({ cwd = "~/vimwiki" })
                        end
                    end)
                    return true
                end,
            }):find()
        end, { desc = "Telescope Hub" })
    end,
}
