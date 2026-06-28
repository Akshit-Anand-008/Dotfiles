local M = {}
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local make_entry = require "telescope.make_entry"
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values
local home_dir = vim.fn.expand("~")

-- Path builder
local resolve_path = function(char, len, file_dir, cwd)
    if char == "h" then
        return home_dir
    elseif char == "w" then
        return vim.fn.expand("$NB_DIR")
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

local my_sorter = conf.generic_sorter({})
local original_score = my_sorter.score
my_sorter.score = function(self, prompt, line, entry)
    local pieces = vim.split(prompt, "  ", { plain = true, trimempty = true })
    local search_term = (pieces[1] and pieces[1] ~= "") and pieces[1] or prompt
    return original_score(self, search_term, line, entry)
end

-- fileseek function
M.fileseek = function()
    local f_dir = vim.fn.expand("%:p:h")
    local f_cwd = vim.fn.getcwd()
    local my_finder = finders.new_async_job {
        command_generator = function(prompt)
            local args = { "fd", "--type", "f" }
            local pieces = vim.split(prompt, "  ", { plain = true, trimempty = true })
            if pieces[1] and pieces[1] ~= "" then table.insert(args, pieces[1]) end
            if pieces[2] and pieces[2] ~= "" then
                local path = resolve_path(pieces[2]:sub(1, 1), #pieces[2], f_dir, f_cwd)
                if path then
                    table.insert(args, "--search-path")
                    table.insert(args, path)
                end
            end
            return args
        end,
        entry_maker = make_entry.gen_from_file()
    }

    pickers.new({}, {
        prompt_title = "FILES",
        finder = my_finder,
        sorter = my_sorter,
        previewer = conf.file_previewer({}),
    }):find()
end
return M
