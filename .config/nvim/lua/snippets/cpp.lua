local ls = require "luasnip"
local sn = ls.snippet_node
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node
local c = ls.choice_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt


ls.add_snippets(
    "cpp",
    {
        s("for", fmt("for (int i = 0; i < {}; i++) {{ {} }}", { i(1), i(0) })),

        s("pr", fmt(
            [[printf("{var1}:%i, {var2}:%i \n ", {rep1}, {rep2});{final}]], {
                var1 = i(1, "name1"),
                var2 = i(2, "name2"),
                rep1 = rep(1),
                rep2 = rep(2),
                final = i(0)
            })
        )
    }
)
