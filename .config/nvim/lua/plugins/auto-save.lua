return {
    "pocco81/auto-save.nvim",
    cmd = "ASToggle",
    opts = {
        enabled = false,
        execution_message = { enabled = false, message = "", },
        trigger_events = { "InsertLeave", "TextChanged" },
        condition = function(buf)
            local fn = vim.fn
            return { fn.getbufvar(buf, "&modifiable") == 1 and fn.getbufvar(buf, "&modified") == 1 }
        end,
        write_all_buffers = false,
        debounce_delay = 135,
    },
}
