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
                { f(function(parameters)
                    local ans = ""
                    local parts = vim.split(parameters[1][1], ",", { plain = true, trimempty = true })
                    for _, i in ipairs(parts) do ans = ans .. i .. ":%i, " end
                    return ans or ""
                end, { 1 }), i(1) }
            )
        ),
    }
)
