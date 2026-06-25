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
        local ts_repeat_move = require "nvim-treesitter-textobjects.repeatable_move"
        local map = vim.keymap.set
        local wot = function(key, object)
            map({ "x", "o" }, 'a' .. key, function() textobj('@' .. object .. '.outer', "textobjects") end)
            map({ "x", "o" }, 'i' .. key, function() textobj('@' .. object .. '.inner', "textobjects") end)
        end

        wot('f', "call")
        wot('c', "class")
        wot('m', "function")

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
    end,
}
