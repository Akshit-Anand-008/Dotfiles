-- fzf-lua version of the telescope setup.
-- Needs fzf-lua (a version that has `fzf_live`), plus fzf and fd on $PATH.

local fzf = require("fzf-lua")

fzf.setup({
    winopts = {
        height = 0.9,
        width = 0.9,
        row = 0.5, -- centred like telescope (fzf-lua defaults to 0.35 / 0.55)
        col = 0.5,
        preview = {
            layout = "vertical",
            vertical = "up:40%", -- preview_height = 0.3
        },
    },
    fzf_opts = { ["--layout"] = "default" },
    defaults = { formatter = "path.filename_first" },
})

vim.keymap.set("n", "<leader>fd", fzf.builtin) -- list of fzf-lua pickers
vim.keymap.set("n", "<leader>fb", fzf.buffers)
vim.keymap.set("n", "<leader>fg", fzf.live_grep)
vim.keymap.set("n", "<leader>fh", fzf.helptags)
vim.keymap.set("n", "<leader>fr", fzf.oldfiles)
vim.keymap.set("n", "<leader>fm", fzf.marks)
vim.keymap.set("n", "<leader>fs", fzf.lsp_document_symbols)

-- "<query>  <key>" file picker ------------------------------------------------
-- Everything before the double space is the fuzzy query. The key after it picks
-- the directory fd searches: h = $HOME, w = $NB_DIR, r = the current file's dir
-- (rr = its parent, ...), . = cwd's parent (.. = grandparent, ...).

local resolve_path = function(char, len, file_dir, cwd)
    if char == "h" then
        return vim.fn.expand("$HOME")
    elseif char == "w" then
        return vim.fn.expand("$NB_DIR")
    elseif char == "r" then
        local p = file_dir
        for _ = 1, len - 1 do p = vim.fn.fnamemodify(p, ":h") end
        return p
    elseif char == "." then
        local p = cwd
        for _ = 1, len do p = vim.fn.fnamemodify(p, ":h") end
        return p
    end
    return nil
end

local fileseek = function()
    -- Grab these before the picker opens: the callback below runs while the fzf
    -- terminal is the current buffer, so "%" would no longer be your file.
    local f_dir = vim.fn.expand("%:p:h")
    local f_cwd = vim.fn.getcwd()

    fzf.fzf_live(function(args)
        -- the query arrives as args[1]; accept a bare string too
        local query = type(args) == "table" and args[1] or args
        if type(query) ~= "string" then query = "" end

        local pieces = vim.split(query, "  ", { plain = true })
        local pattern, key = pieces[1], pieces[2]

        local cmd = "fd --type file --color never"
        if key and key ~= "" and key ~= " " then
            -- an unknown key letter falls back to cwd instead of making fd error out
            local dir = resolve_path(key:sub(1, 1), #key, f_dir, f_cwd)
            if dir then cmd = cmd .. " --search-path " .. vim.fn.shellescape(dir) end
        end
        cmd = cmd .. " 2>/dev/null"

        -- Live pickers run fzf with --disabled and reload on every keystroke, so
        -- nothing would fuzzy-match <query> unless we do it here.
        if pattern ~= "" then
            cmd = cmd .. " | fzf " .. vim.fn.shellescape("--filter=" .. pattern)
        end
        return cmd
    end, {
        prompt = "FILES> ",
        cwd = f_cwd,
        exec_empty_query = true, -- fill the list before anything is typed
        previewer = "builtin",
        actions = fzf.defaults.actions.files,
    })
end
vim.keymap.set("n", "<leader>ff", fileseek)
