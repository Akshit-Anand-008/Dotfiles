return {
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
        local map = vim.keymap.set

        map({ "x", "o" }, "am", function() textobj("@function.outer", "textobjects") end)
        map({ "x", "o" }, "im", function() textobj("@function.inner", "textobjects") end)
        map({ "x", "o" }, "ac", function() textobj("@class.outer", "textobjects") end)
        map({ "x", "o" }, "ic", function() textobj("@class.inner", "textobjects") end)
        map({ "x", "o" }, "af", function() textobj("@call.outer", "textobjects") end)
        map({ "x", "o" }, "if", function() textobj("@call.inner", "textobjects") end)
        map({ "x", "o" }, "aa", function() textobj("@parameter.outer", "textobjects") end)
        map({ "x", "o" }, "ia", function() textobj("@parameter.inner", "textobjects") end)

        map({ "n", "x", "o" }, "]m", function() move.goto_next_start("@function.outer", "textobjects") end)
        map({ "n", "x", "o" }, "]M", function() move.goto_next_end("@function.outer", "textobjects") end)
        map({ "n", "x", "o" }, "[m", function() move.goto_previous_start("@function.outer", "textobjects") end)
        map({ "n", "x", "o" }, "[M", function() move.goto_previous_end("@function.outer", "textobjects") end)

        map({ "n", "x", "o" }, "]c", function() move.goto_next_start("@class.outer", "textobjects") end)
        map({ "n", "x", "o" }, "]C", function() move.goto_next_end("@class.outer", "textobjects") end)
        map({ "n", "x", "o" }, "[c", function() move.goto_previous_start("@class.outer", "textobjects") end)
        map({ "n", "x", "o" }, "[C", function() move.goto_previous_end("@class.outer", "textobjects") end)

        map({ "n", "x", "o" }, "]f", function() move.goto_next_start("@call.outer", "textobjects") end)
        map({ "n", "x", "o" }, "[f", function() move.goto_previous_start("@call.outer", "textobjects") end)

        map({ "n", "x", "o" }, "]a", function() move.goto_next_start("@parameter.inner", "textobjects") end)
        map({ "n", "x", "o" }, "[a", function() move.goto_previous_start("@parameter.inner", "textobjects") end)

        local ts_repeat_move = require "nvim-treesitter-textobjects.repeatable_move"
        vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
        vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)
        vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
        vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
        vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
        vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
    end,
}
