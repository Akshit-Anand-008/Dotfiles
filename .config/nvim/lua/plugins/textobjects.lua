return {
    "nvim-treesitter/nvim-treesitter-textobjects",
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
        vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
        vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)
        vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
        vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
        vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
        vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })

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
        wot('r', "return")

        map({ "n", "x", "o" }, "]M", function() move.goto_next_end("@function.outer", "textobjects") end)
        map({ "n", "x", "o" }, "[M", function() move.goto_previous_end("@function.outer", "textobjects") end)
        map({ "n", "x", "o" }, "]C", function() move.goto_next_end("@class.outer", "textobjects") end)
        map({ "n", "x", "o" }, "[C", function() move.goto_previous_end("@class.outer", "textobjects") end)

        map({ "x", "o" }, 'aB', function() textobj("@block.outer", "textobjects") end)
        map({ "n", "x", "o" }, ']B', function() move.goto_next_start("@block.outer", "textobjects") end)
        map({ "n", "x", "o" }, '[B', function() move.goto_previous_start("@block.outer", "textobjects") end)

        map({ "x", "o" }, 'a=', function() textobj("@assignment.outer", "textobjects") end)
        map({ "x", "o" }, 'i=', function() textobj("@assignment.rhs", "textobjects") end)
        map({ "n", "x", "o" }, ']=', function() move.goto_next_start("@assignment.outer", "textobjects") end)
        map({ "n", "x", "o" }, '[=', function() move.goto_previous_start("@assignment.outer", "textobjects") end)
    end,
}
