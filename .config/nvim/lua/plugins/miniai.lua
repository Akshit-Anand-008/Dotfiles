return {
    "nvim-mini/mini.ai",
    config = function()
        pair = require("mini.ai").gen_spec.pair
        require('mini.ai').setup({
            custom_textobjects = {
                b = pair('(', ')', { search_method = "next" }),
                B = pair('{', '}', { search_method = "next" })
            },
            mappings = {
                inside_last = '',
                around_last = '',
            }
        })
    end
}
