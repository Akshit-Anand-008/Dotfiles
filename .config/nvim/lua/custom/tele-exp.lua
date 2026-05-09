local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local make_entry = require "telescope.make_entry"
local sorters = require "telescope.sorters"
local conf = require("telescope.config").values
local current_file_dir = vim.fn.expand("%:p:h")
local current_cwd = vim.fn.getcwd()
local home_dir = vim.fn.expand("~")

local fileseek = function()
    local my_finder = finders.new_async_job {
        command_generator = function(prompt)
            if not prompt or prompt == "" then return nil end
            local pieces = vim.split(prompt, "  ")
            local args = { "fd", "--type", "f" }
            if pieces[1] and pieces[1] ~= "" then
                table.insert(args, pieces[1])
            end
            if pieces[2] then
                local str = pieces[2]
                local i1 = string.sub(str, 1, 1)
                local len = string.len(str)
                local target_path

                if i1 == "h" then
                    target_path = home_dir
                elseif i1 == "w" then
                    target_path = vim.fn.expand("$WIKI_PATH")
                elseif i1 == "r" then
                    target_path = current_file_dir
                    for _ = 1, len - 1 do
                        target_path = vim.fn.fnamemodify(target_path, ":h")
                    end
                elseif i1 == "." then
                    target_path = current_cwd
                    for _ = 1, len do
                        target_path = vim.fn.fnamemodify(target_path, ":h")
                    end
                end
                if target_path then
                    table.insert(args, target_path)
                end
            end
            vim.print(args)
            return args
        end,
        entry_maker = make_entry.gen_from_file()
    }
    pickers.new({}, {
        debounce = 100,
        prompt_title = "FILE_FINDER",
        finder = my_finder,
        sorter = sorters.empty(),
    }):find()
end

local grepseek = function()
    local my_finder = finders.new_async_job {
        command_generator = function(prompt)
            if not prompt or prompt == "" then return nil end
            local pieces = vim.split(prompt, "  ")
            local args = { "rg" }

            if pieces[1] and pieces[1] ~= "" then
                table.insert(args, "-e")
                table.insert(args, pieces[1])
            end

            if pieces[2] then
                local str = pieces[2]
                local i1 = string.sub(str, 1, 1)
                local len = string.len(str)
                local target_path

                if i1 == "h" then
                    target_path = home_dir
                elseif i1 == "w" then
                    target_path = vim.fn.expand("$WIKI_PATH")
                elseif i1 == "r" then
                    target_path = current_file_dir
                    for _ = 1, len - 1 do
                        target_path = vim.fn.fnamemodify(target_path, ":h")
                    end
                elseif i1 == "." then
                    target_path = current_cwd
                    for _ = 1, len do
                        target_path = vim.fn.fnamemodify(target_path, ":h")
                    end
                end

                if target_path then
                    table.insert(args, target_path)
                end
            end
            vim.print(args)
            return args
        end,

        entry_maker = make_entry.gen_from_vimgrep(),
    }

    pickers.new({}, {
        debounce = 100,
        prompt_title = "MULTI_GREP",
        finder = my_finder,
        previewer = conf.grep_previewer(),
        sorter = sorters.empty(),
    }):find()
end

vim.keymap.set("n", "<leader>ff", fileseek)
vim.keymap.set("n", "<leader>fb", grepseek)
