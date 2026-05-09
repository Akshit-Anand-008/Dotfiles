return {
    "nvim-telescope/telescope.nvim",
    version = '*',
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },

    config = function()
        local pickers = require "telescope.pickers"
        local finders = require "telescope.finders"
        local make_entry = require "telescope.make_entry"
        local sorters = require "telescope.sorters"
        local builtin = require "telescope.builtin"
        local conf = require("telescope.config").values
        local home_dir = vim.fn.expand("~")

        -- Path builder
        local resolve_path = function(char, len, file_dir, cwd)
            if char == "h" then
                return home_dir
            elseif char == "w" then
                return vim.fn.expand("$WIKI_PATH")
            elseif char == "r" then
                local p = file_dir
                for _ = 1, len - 1 do p = vim.fn.fnamemodify(p, ":h") end
                return p
            elseif char == "." then
                local p = cwd
                for _ = 1, len do p = vim.fn.fnamemodify(p, ":h") end
                return p
            end
            return nil
        end

        -- filessek function
        local fileseek = function()
            local f_dir = vim.fn.expand("%:p:h")
            local f_cwd = vim.fn.getcwd()

            local my_finder = finders.new_async_job {
                command_generator = function(prompt)
                    if not prompt or prompt == "" then return nil end
                    local pieces = vim.split(prompt, "  ")
                    local args = { "fd", "--type", "f", }

                    if pieces[1] and pieces[1] ~= "" then
                        table.insert(args, pieces[1])
                    end

                    if pieces[2] then
                        local path = resolve_path(pieces[2]:sub(1, 1), #pieces[2], f_dir, f_cwd)
                        if path then table.insert(args, path) end
                    end
                    vim.print(args)
                    return args
                end,
                entry_maker = make_entry.gen_from_file()

            }

            pickers.new({}, {
                prompt_title = "Find Files",
                finder = my_finder,
                sorter = sorters.empty(),
                previewer = conf.file_previewer({}),
            }):find()
        end

        -- grepseeek function
        local grepseek = function()
            local f_dir = vim.fn.expand("%:p:h")
            local f_cwd = vim.fn.getcwd()

            local my_finder = finders.new_async_job {
                command_generator = function(prompt)
                    if not prompt or prompt == "" then return nil end
                    local pieces = vim.split(prompt, "  ")
                    local args = { "rg", "--vimgrep", "--smart-case" }
                    if pieces[1] and pieces[1] ~= "" then
                        table.insert(args, "-e")
                        table.insert(args, pieces[1])
                    end


                    if pieces[2] then
                        local path = resolve_path(pieces[2]:sub(1, 1), #pieces[2], f_dir, f_cwd)
                        if path then table.insert(args, path) end
                    end
                    vim.print(args)
                    return args
                end,
                entry_maker = make_entry.gen_from_vimgrep(),
            }

            pickers.new({}, {
                prompt_title = "Multi Grep",
                finder = my_finder,
                previewer = conf.grep_previewer({}),
                sorter = sorters.empty(),
            }):find()
        end

        vim.keymap.set("n", "<leader>ff", fileseek)
        vim.keymap.set("n", "<leader>fg", grepseek)
        vim.keymap.set("n", "<leader>fr", function() builtin.oldfiles() end)
        vim.keymap.set('n', '<leader>m', function() builtin.marks() end)
        vim.keymap.set('n', '<leader>t', "<cmd>Telescope builtin<CR>")
    end,
}
