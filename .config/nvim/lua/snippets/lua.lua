local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("lua",
    {
        s("req",
            fmt(
                [[local {} = require "{}"]],
                { f(function(import_name)
                    local parts = vim.split(import_name[1][1], ".", { plain = true, trimempty = true })
                    return parts[#parts] or ""
                end, { 1 }), i(1) }
            )
        )
    }
)
