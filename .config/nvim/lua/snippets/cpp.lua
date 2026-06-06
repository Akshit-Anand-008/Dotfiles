local ls = require "luasnip"
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

local boom = function(arg)
    parts = arg.split(",")
    local ans = ""
    for _, i in parts do
        ans = ans .. i .. ":%i, "
    end
end

ls.add_snippets(
    "cpp",
    {
        s("for",
            fmt(
                "for (int i = 0; i < {}; i++) {{ {} }}",
                { i(1), i(0) }
            )
        ),

        s("pr",
            fmt(
                [[printf("{}\n",{});]],
                { f(function(args)
                    local parts = vim.split(args[1][1], ",", { plain = true, trimempty = true })
                    local fmt_str = {}
                    for _, var in ipairs(parts) do table.insert(fmt_str, vim.trim(var) .. ":%i") end
                    return table.concat(fmt_str, ", ") or ""
                end, { 1 }), i(1) }
            )
        ),
    }
)
