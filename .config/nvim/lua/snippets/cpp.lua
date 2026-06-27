local ls = require "luasnip"
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local extras = require("luasnip.extras")
local rep = extras.rep

ls.add_snippets(
    "cpp",
    {
        s("for",
            fmt(
                [[for (int {} = 0; {} < {}; {}++) {{ {} }}]],
                { i(1, "i"), rep(1), i(2), rep(1), i(0) }
            )
        ),

        s("fora",
            fmt(
                [[for (auto& {} : {}) {{ {} }}]],
                { i(1, "i"), i(2), i(0) }
            )
        ),

        s("pr",
            fmt(
                [[printf("{}\n",{});]],
                {
                    f(function(args)
                        local parts = vim.split(args[1][1], ",", { plain = true, trimempty = true })
                        local fmt_str = {}
                        for _, var in ipairs(parts) do table.insert(fmt_str, vim.trim(var) .. ":%i") end
                        return table.concat(fmt_str, ", ") or ""
                    end, { 1 }), i(1)
                }
            )
        ),

        s(
            "p",
            fmt(
                [[printf("{}\n"{});]],
                { i(1), i(0) }
            )
        ),

        s("sort",
            fmt(
                [[sort({}.begin(),{}.end(){});]],
                { i(1), rep(1), i(0) }
            )
        )
    }
)
