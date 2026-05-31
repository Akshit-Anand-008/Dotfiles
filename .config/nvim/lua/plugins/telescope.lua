return {
    "nvim-telescope/telescope.nvim",
    version = '*',
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },

    config = function()
        require("telescope").setup({
            defaults = {
                path_display = { "truncate" },
                layout_strategy = "vertical",
                layout_config = {
                    height = 0.9,
                    width = 0.9,
                    preview_cutoff = 0,
                    preview_height = 0.3
                },
            }
        })

        local pickers = require "telescope.pickers"
        local finders = require "telescope.finders"
        local make_entry = require "telescope.make_entry"
        local sorters = require "telescope.sorters"
        local builtin = require "telescope.builtin"
        local conf = require("telescope.config").values
        local home_dir = vim.fn.expand("~")

        -- Key maps
        vim.keymap.set('n', '<leader>fd', "<cmd>Telescope builtin<CR>")
        vim.keymap.set('n', '<leader>fl', builtin.lsp_document_symbols)
        vim.keymap.set('n', '<leader>fb', builtin.buffers)
        vim.keymap.set('n', '<leader>fh', builtin.help_tags)
        vim.keymap.set("n", "<leader>fr", builtin.oldfiles)
        vim.keymap.set('n', '<leader>fm', builtin.marks)

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

        -- fileseek function
        local fileseek = function()
            local f_dir = vim.fn.expand("%:p:h")
            local f_cwd = vim.fn.getcwd()
            local my_finder = finders.new_async_job {
                command_generator = function(prompt)
                    local args = { "fd", "--type", "f" }
                    local pieces = vim.split(prompt, "  ")
                    if pieces[1] and pieces[1] ~= "" then
                        table.insert(args, pieces[1])
                    end
                    if pieces[2] and pieces[2] ~= "" then
                        local path = resolve_path(pieces[2]:sub(1, 1), #pieces[2], f_dir, f_cwd)
                        table.insert(args, "--search-path")
                        if path then table.insert(args, path) end
                    end
                    vim.print("$ " .. table.concat(args, " "))
                    return args
                end,

                entry_maker = make_entry.gen_from_file()
            }
            pickers.new({}, {
                prompt_title = "FILES",
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
                    local args = {
                        "rg",
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case"
                    }
                    local paper = "$ rg "
                    if pieces[1] and pieces[1] ~= "" then
                        table.insert(args, "-e")
                        table.insert(args, pieces[1])
                        paper = paper .. "-e " .. pieces[1]
                    end
                    if pieces[2] and pieces[2] ~= "" then
                        local path = resolve_path(pieces[2]:sub(1, 1), #pieces[2], f_dir, f_cwd)
                        if path then table.insert(args, path) end
                        paper = paper .. " " .. path
                    end
                    vim.notify(paper)
                    return args
                end,

                entry_maker = make_entry.gen_vimgrep()
            }
            pickers.new({}, {
                prompt_title = "GREP",
                finder = my_finder,
                previewer = conf.grep_previewer({}),
                sorter = sorters.empty(),
            }):find()
        end

        vim.keymap.set("n", "<leader>ff", fileseek)
        vim.keymap.set("n", "<leader>fg", grepseek)
    end,
}
