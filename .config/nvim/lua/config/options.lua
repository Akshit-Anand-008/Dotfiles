-- Basics
vim.opt.timeoutlen = 10000        -- Gives me more time to press keys
vim.opt.confirm = true            -- Confirm to save changes before exiting
vim.opt.undofile = true           -- Save undo history to a file
vim.opt.swapfile = false          -- Do not create swap file
-- vim.opt.autowrite = true          -- Automatically save before running external commands
vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard

-- Interface & UI
vim.opt.scrolloff = 3         -- Keep lines of context when scrolling
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers for jumping
vim.opt.cursorline = true     -- Highlight the line the cursor is on
vim.opt.termguicolors = true  -- Enable 24-bit RGB colors
vim.opt.splitright = true     -- Split on right instead of left
vim.opt.splitbelow = true     -- Split on below instead of top
vim.opt.showmode = false      -- Hide mode text
vim.opt.signcolumn = "yes"    -- Always show the column for icons/errors
vim.opt.virtualedit = "block" -- Allows cursor to move anywhere in V-Block mode

-- Indentation & Tabs
vim.opt.tabstop = 4        -- 1 tab = 4 spaces
vim.opt.softtabstop = 4    -- Number of spaces for editing tabs
vim.opt.shiftwidth = 4     -- Size of an indent
vim.opt.autoindent = true  -- Copy indent from current line
vim.opt.breakindent = true -- Wrapped lines keep indentation
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.shiftround = true  -- Round indent to multiple of shiftwidth

-- Search Behavior
vim.opt.ignorecase = true    -- Case-insensitive search...
vim.opt.smartcase = true     -- ...unless capital letters are used
vim.opt.hlsearch = false     -- Do not higlight after searching is done
vim.opt.incsearch = true     -- Show matches while typing
vim.opt.inccommand = "split" -- Preview search/replace in a split window

-- Visuals
vim.opt.list = true -- Show invisible characters
vim.opt.listchars = {
    tab = "» ",
    trail = "·",
    nbsp = "␣",
    -- eol = "↲"
}

-- Configure ripgrep for global searching
if vim.fn.executable("rg") == 1 then
    vim.opt.grepprg = "rg --vimgrep"
    vim.opt.grepformat = "%f:%l:%c:%m"
end
