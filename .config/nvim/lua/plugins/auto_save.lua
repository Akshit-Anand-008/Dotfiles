return {
    "pocco81/auto-save.nvim",
    cmd = "ASToggle",
    lazy = true,
    keys = {},
    opts = {
        enabled = false,
        execution_message = {
            enabled = false,
            message = function()
                return ""
            end,
        },
        trigger_events = { "InsertLeave", "TextChanged" },
        condition = function(buf)
            local fn = vim.fn
            if
                fn.getbufvar(buf, "&modifiable") == 1 and fn.getbufvar(buf, "&modified") == 1
            then
                return true
            end
            return false
        end,
        write_all_buffers = false,
        debounce_delay = 135,
    },
    init = function()
        vim.keymap.set("n", "<A-s>", ":ASToggle<CR>", { desc = "toggle auto-save" })
    end
}
