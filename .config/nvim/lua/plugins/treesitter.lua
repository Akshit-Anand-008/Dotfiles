return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            auto_install = { enable = true },
            highlight = { enable = true },
            indent = { enable = true },
        },
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
                        ['@parameter.outer'] = 'v', -- charwise
                        ['@function.outer'] = 'V',  -- linewise
                        -- ['@class.outer'] = '<c-v>', -- blockwise
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
            -- map({ "x", "o" }, "as", function() textobj("@local.scope", "locals") end)

            map({ "n", "x", "o" }, "]f", function() move.goto_next_start("@function.outer", "textobjects") end)
            map({ "n", "x", "o" }, "]F", function() move.goto_next_end("@function.outer", "textobjects") end)
            map({ "n", "x", "o" }, "]c", function() move.goto_next_start("@class.outer", "textobjects") end)
            map({ "n", "x", "o" }, "]C", function() move.goto_next_end("@class.outer", "textobjects") end)
            map({ "n", "x", "o" }, "[f", function() move.goto_previous_start("@function.outer", "textobjects") end)
            map({ "n", "x", "o" }, "[F", function() move.goto_previous_end("@function.outer", "textobjects") end)
            map({ "n", "x", "o" }, "[c", function() move.goto_previous_start("@class.outer", "textobjects") end)
            map({ "n", "x", "o" }, "[C", function() move.goto_previous_end("@class.outer", "textobjects") end)
            -- map({ "n", "x", "o" }, "]s", function() move.goto_next_start("@local.scope", "locals") end)
            -- map({ "n", "x", "o" }, "]z", function() move.goto_next_start("@fold", "folds") end)
            -- map({ "n", "x", "o" }, "]o",
            --     function() move.goto_next_start({ "@loop.inner", "@loop.outer" }, "textobjects") end)

            map({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
            map({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)
            map({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
            map({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
            map({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
            map({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
        end,
    }
}
