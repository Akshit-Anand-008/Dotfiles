-- SECTION 1: Interface & UI
vim.opt.timeoutlen = 10000    -- Gives me more time to press keys
vim.opt.scrolloff = 3         -- Keep lines of context when scrolling
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers for jumping
vim.opt.cursorline = true     -- Highlight the line the cursor is on
vim.opt.termguicolors = true  -- Enable 24-bit RGB colors
vim.opt.confirm = true        -- Confirm to save changes before exiting
vim.opt.splitright = true     -- Split on right instead of left
vim.opt.splitbelow = true     -- Split on below instead of top
vim.opt.showmode = false      -- Hide mode text
vim.opt.signcolumn = "yes"    -- Always show the column for icons/errors
vim.opt.virtualedit = "block" -- Allows cursor to move anywhere in V-Block mode
-- vim.opt.mouse = ""            -- Disable mouse
vim.opt.textwidth = 0

-- SECTION 2: Indentation & Tabs
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.tabstop = 4        -- 1 tab = 4 spaces
vim.opt.softtabstop = 4    -- Number of spaces for editing tabs
vim.opt.shiftwidth = 4     -- Size of an indent
vim.opt.autoindent = true  -- Copy indent from current line
vim.opt.breakindent = true -- Wrapped lines keep indentation
vim.opt.shiftround = true  -- Round indent to multiple of shiftwidth

-- SECTION 3: Search Behavior
vim.opt.ignorecase = true    -- Case-insensitive search...
vim.opt.smartcase = true     -- ...unless capital letters are used
vim.opt.hlsearch = false     -- Do not higlight after searching is done
vim.opt.incsearch = true     -- Show matches while typing
vim.opt.inccommand = "split" -- Preview search/replace in a split window

-- Configure ripgrep for global searching
if vim.fn.executable("rg") == 1 then
    vim.opt.grepprg = "rg --vimgrep"
    vim.opt.grepformat = "%f:%l:%c:%m"
end

-- SECTION 4: File Handling & Performance
vim.opt.undofile = true           -- Save undo history to a file
vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard

-- SECTION 5: Formatting & Visuals
vim.opt.formatoptions = "jqlrntc" -- Modern text wrapping/formatting logic
vim.opt.list = true               -- Show invisible characters
vim.opt.listchars = {
    tab = "» ",
    trail = "·",
    nbsp = "␣",
    -- eol = "↲"
}

-- SECTION 6: Cursor Customization
vim.api.nvim_set_hl(0, "VisualCursor", { bg = "#c099ff" })
vim.api.nvim_set_hl(0, "TerminalCursor", { bg = "#3ddbd9" })
vim.opt.guicursor = {
    "a:blinkon0",             -- Disable blinking
    "n:block-Cursor",         -- Normal: White block
    "t:block-TerminalCursor", -- Terminal: Blue
    "v:block-VisualCursor",   -- Visual: Purple block
    "i-c-ci:ver25-Cursor",    -- Insert: Thin vertical line
    "r-cr-ve:hor20-Cursor",   -- Replace: Horizontal bar
}
