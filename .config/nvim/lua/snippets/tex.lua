local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("tex",
    {
        s("\\b", {
            t("\\begin{"), i(1), t("}"),
            t({ "", "\t" }), i(0),
            t({ "", "\\end{" }), rep(1), t("}"), }
        )
    }
)
