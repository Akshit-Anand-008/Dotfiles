return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    init = function() vim.g.no_plugin_maps = true end,

    config = function()
        require("nvim-treesitter-textobjects").setup {
            select = {
                lookahead = true,
                include_surrounding_whitespace = false,
                selection_modes = {
                    ['@parameter.outer'] = 'v',
                    ['@function.outer'] = 'V',
                }
            },
            move = { set_jumps = true }
        }

        local textobj = require("nvim-treesitter-textobjects.select").select_textobject
        local move = require("nvim-treesitter-textobjects.move")
        local map = vim.keymap.set

        local ts_repeat_move = require "nvim-treesitter-textobjects.repeatable_move"
        map({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
        map({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)
        map({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
        map({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
        map({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
        map({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })

        local wot = function(key, object)
            local oi = '@' .. object .. '.inner'
            local oo = '@' .. object .. '.outer'
            map({ "x", "o" }, 'a' .. key, function() textobj(oo, "textobjects") end)
            map({ "x", "o" }, 'i' .. key, function() textobj(oi, "textobjects") end)
            map({ "n", "x", "o" }, ']' .. key, function() move.goto_next_start(oo, "textobjects") end)
            map({ "n", "x", "o" }, '[' .. key, function() move.goto_previous_start(oo, "textobjects") end)
        end

        wot('f', "call")
        wot('c', "class")
        wot('m', "function")
        wot('a', "parameter")
        wot('b', "block")
    end,
}
