local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("markdown",
    {
        s("end",
            t("<!-- end_slide -->")
        ),

        s("p",
            t("<!-- pause -->")
        ),

        s("il",
            t("<!-- incremental_lists: true -->")
        ),

        s("n",
            t("<!-- new_line -->")
        )
    }
)
