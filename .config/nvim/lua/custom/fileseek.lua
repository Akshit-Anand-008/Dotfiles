local M = {}
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values

local resolve_path = function(char, len, file_dir, cwd)
    if char == "h" then
        return vim.fn.expand("$HOME")
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

M.fileseek = function()
    local f_dir = vim.fn.expand("%:p:h")
    local f_cwd = vim.fn.getcwd()
    pickers.new({}, {
        prompt_title = "FILES",
        finder = finders.new_oneshot_job({ "fd", "--type", "file", "--color", "never" }, {}),
        sorter = conf.generic_sorter({}),
        previewer = conf.file_previewer({}),
        on_input_filter_cb = function(prompt)
            local last_dir = f_cwd
            local pieces = vim.split(prompt, "  ", { plain = true, trimempty = true })
            if pieces[2] and pieces[2] ~= "" then
                local path = resolve_path(pieces[2]:sub(1, 1), #pieces[2], f_dir, f_cwd)
                dir = path or last_dir
                if dir == last_dir then
                    return { prompt = pieces[1] }
                end
                last_dir = dir
                return {
                    prompt = pieces[1],
                    updated_finder = finders.new_oneshot_job(
                        { "fd", "--type", "file", "--color", "never", "--search-path", dir }, {}),
                }
            end
        end
    }):find()
end

return M
