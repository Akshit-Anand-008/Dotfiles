local M = {}

local builtin = require "telescope.builtin"
local fileseek = function()
    builtin.find_files({
        search_dirs = { "/home/akshit_anand/NoteBooks/" },
        on_input_filter_cb = function(prompt)
            local pieces = vim.split(prompt, "  ", { plain = true, trimempty = true })
            local clean_search = pieces[1] and pieces[1] or prompt
            vim.print(pieces)
            return {
                prompt = clean_search,
                updated_finder = require("telescope.finders").new_oneshot_job(
                    { "fd", "--type", "file", "--color", "never", "--search_path", "/home/akshit_anand/Snippets" },
                    {}
                )
            }
        end,
    })
end
vim.keymap.set('n', '<leader>ff', fileseek)

return M
