require('telescope').setup({
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
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local builtin = require "telescope.builtin"

vim.keymap.set('n', '<leader>fd', builtin.builtin)
vim.keymap.set('n', '<leader>fb', builtin.buffers)
vim.keymap.set('n', '<leader>fg', builtin.live_grep)
vim.keymap.set('n', '<leader>fh', builtin.help_tags)
vim.keymap.set('n', '<leader>fr', builtin.oldfiles)
vim.keymap.set('n', '<leader>fm', builtin.marks)
vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols)

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

local fileseek = function()
    local f_dir = vim.fn.expand("%:p:h")
    local f_cwd = vim.fn.getcwd()
    local last_key = nil
    pickers.new({}, {
        prompt_title = "FILES",
        finder = finders.new_oneshot_job({ "fd", "--type", "file", "--color", "never" }, {}),
        sorter = conf.generic_sorter({}),
        previewer = conf.file_previewer({}),
        on_input_filter_cb = function(prompt)
            local pieces = vim.split(prompt, "  ", { plain = true })
            local key = pieces[2]
            if key ~= last_key then
                last_key = key
                local dir
                if key and key ~= "" and key ~= " " then
                    dir = resolve_path(key:sub(1, 1), #key, f_dir, f_cwd)
                    return {
                        prompt = pieces[1],
                        updated_finder = finders.new_oneshot_job(
                            { "fd", "--type", "file", "--color", "never", "--search-path", dir }, {}
                        )
                    }
                else
                    dir = f_cwd
                    return {
                        prompt = pieces[1],
                        updated_finder = finders.new_oneshot_job(
                            { "fd", "--type", "file", "--color", "never" }, {}
                        )
                    }
                end
            end
            return { prompt = pieces[1] or prompt }
        end
    }):find()
end
vim.keymap.set('n', '<leader>ff', fileseek)
