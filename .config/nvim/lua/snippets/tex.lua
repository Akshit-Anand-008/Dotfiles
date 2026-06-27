local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmta = require("luasnip.extras.fmt").fmta

ls.add_snippets("tex",
    {
        s("e",
            fmta(
                "\\begin{<>}\n<>\n\\end{<>}",
                { i(1), i(0), rep(1) }
            )
        ),

        s("m",
            fmta(
                "\\[\n\t<>\n\\]",
                { i(0) }
            )
        ),

        s("f",
            fmta(
                [[\frac{<>}{<>}]],
                { i(1), i(0) }
            )
        )
    }
)
