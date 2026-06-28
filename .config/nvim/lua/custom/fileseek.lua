local M = {}
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local sorters = require "telescope.sorters"
local make_entry = require "telescope.make_entry"
local conf = require("telescope.config").values
local home_dir = vim.fn.expand("~")

-- Path builder (Kept intact, works perfectly)
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



local fileseek = function()
    pickers.new({}, {
        prompt_title = "FILES",
        finder = finders.new_oneshot_job({ "fd", "--type", "file", "--color", "never" }, {}),
        sorter = conf.generic_sorter({}),
        previewer = conf.file_previewer({}),
        on_input_filter_cb = function(prompt)
            local pieces = vim.split(prompt, "  ", { plain = true, trimempty = true })
            local clean_search = pieces[1] and pieces[1] or prompt
            vim.print(pieces)
            return { prompt = clean_search }
        end,
    }):find()
end

vim.keymap.set('n', '<leader>ff', fileseek)

return M
