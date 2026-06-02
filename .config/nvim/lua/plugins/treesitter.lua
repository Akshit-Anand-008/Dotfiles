return {

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = { highlight = { enable = true } },
        config = function()
            vim.api.nvim_create_autocmd("FileType", {
                callback = function(args)
                    local buf = args.buf
                    local ft = vim.bo[buf].filetype
                    local lang = vim.treesitter.language.get_lang(ft)
                    if not lang then return end
                    local ok_add = pcall(vim.treesitter.language.add, lang)
                    if not ok_add then return end
                    pcall(vim.treesitter.start, buf, lang)
                    -- vim.schedule(function()
                    --     if vim.api.nvim_buf_is_valid(buf) then
                    --         pcall(vim.treesitter.start, buf, lang)
                    --     end
                    -- end)
                end,
            })
        end
    },

    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        init = function() vim.g.no_plugin_maps = true end,

        config = function()
            require("nvim-treesitter-textobjects").setup {
                select = {
                    lookahead = true,
                    include_surrounding_whitespace = false,
                    selection_modes = {
                        ['@parameter.outer'] = 'v',
                        ['@function.outer'] = 'V',
                    },
                },
                move = { set_jumps = true, },
            }

            local textobj = require("nvim-treesitter-textobjects.select").select_textobject
            local move = require("nvim-treesitter-textobjects.move")
            local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")
            local map = vim.keymap.set

            map({ "x", "o" }, "af", function() textobj("@function.outer", "textobjects") end)
            map({ "x", "o" }, "if", function() textobj("@function.inner", "textobjects") end)
            map({ "x", "o" }, "ac", function() textobj("@class.outer", "textobjects") end)
            map({ "x", "o" }, "ic", function() textobj("@class.inner", "textobjects") end)

            map({ "n", "x", "o" }, "]f", function() move.goto_next_start("@function.outer", "textobjects") end)
            map({ "n", "x", "o" }, "]F", function() move.goto_next_end("@function.outer", "textobjects") end)
            map({ "n", "x", "o" }, "]c", function() move.goto_next_start("@class.outer", "textobjects") end)
            map({ "n", "x", "o" }, "]C", function() move.goto_next_end("@class.outer", "textobjects") end)
            map({ "n", "x", "o" }, "[f", function() move.goto_previous_start("@function.outer", "textobjects") end)
            map({ "n", "x", "o" }, "[F", function() move.goto_previous_end("@function.outer", "textobjects") end)
            map({ "n", "x", "o" }, "[c", function() move.goto_previous_start("@class.outer", "textobjects") end)
            map({ "n", "x", "o" }, "[C", function() move.goto_previous_end("@class.outer", "textobjects") end)
        end,
    }
}
