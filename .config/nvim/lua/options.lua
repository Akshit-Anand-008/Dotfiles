-- ~/dotfiles/.config/nvim/lua/options.lua

local opt = vim.opt

-- Global Variables

vim.g.have_nerd_font = true -- Flag for plugins to use icons

-- SECTION 1: Interface & UI
opt.number = true         -- Show line numbers
opt.relativenumber = true -- Show relative line numbers for jumping
opt.cursorline = true     -- Highlight the line the cursor is on
opt.signcolumn = "yes"    -- Always show the column for icons/errors
opt.termguicolors = true  -- Enable 24-bit RGB colors
opt.showmode = false      -- Hide mode text (e.g. -- INSERT --)
opt.scrolloff = 8         -- Keep 8 lines of context when scrolling
opt.confirm = true        -- Confirm to save changes before exiting
opt.mouse = ""            -- Disable mouse
opt.splitright = true
opt.splitbelow = true

-- SECTION 2: Indentation & Tabs
opt.expandtab = true   -- Use spaces instead of tabs
opt.tabstop = 4        -- 1 tab = 4 spaces
opt.softtabstop = 4    -- Number of spaces for editing tabs
opt.shiftwidth = 4     -- Size of an indent
opt.autoindent = true  -- Copy indent from current line
opt.breakindent = true -- Wrapped lines keep indentation
opt.shiftround = true  -- Round indent to multiple of shiftwidth

-- SECTION 3: Search Behavior
opt.ignorecase = true    -- Case-insensitive search...
opt.smartcase = true     -- ...unless capital letters are used
opt.incsearch = true     -- Show matches while typing
opt.inccommand = "split" -- Preview search/replace in a split window

-- Configure ripgrep for global searching
if vim.fn.executable("rg") == 1 then
    opt.grepprg = "rg --vimgrep"
    opt.grepformat = "%f:%l:%c:%m"
end

-- SECTION 4: File Handling & Performance
opt.undofile = true           -- Save undo history to a file
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.updatetime = 250          -- Faster updates (useful for diagnostics)
opt.timeoutlen = 500          -- Wait time for mapped sequences
opt.fileformats = "unix,dos"  -- Line ending preferences
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
opt.shada = "!,'20,<50,s10,h" -- What info to save between sessions

-- SECTION 5: Formatting & Visuals
opt.formatoptions = "jqlrn" -- Modern text wrapping/formatting logic
opt.list = true             -- Show invisible characters
opt.listchars = {
    tab = "» ",
    trail = "·",
    nbsp = "␣",
}

-- SECTION 6: Cursor Customization
vim.api.nvim_set_hl(0, "VisualCursor", { bg = "#c099ff" })
opt.guicursor = {
    "a:blinkon0",         -- Disable blinking
    "n:block-Cursor",     -- Normal: White block
    "v:block-VisualCursor", -- Visual: Purple block
    "i-c-ci:ver25-Cursor", -- Insert: Thin vertical line
    "r-cr-ve:hor20-Cursor", -- Replace: Horizontal bar
}
