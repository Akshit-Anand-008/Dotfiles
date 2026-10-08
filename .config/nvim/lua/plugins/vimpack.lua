vim.pack.add({
    'https://github.com/EdenEast/nightfox.nvim',
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
    'https://github.com/kylechui/nvim-surround',
    'https://github.com/rmagatti/auto-session',
    'https://github.com/lewis6991/gitsigns.nvim',
    'https://github.com/HiPhish/rainbow-delimiters.nvim',
    'https://github.com/windwp/nvim-autopairs',
    'https://github.com/lukas-reineke/indent-blankline.nvim',
    'https://github.com/mbbill/undotree',
    'https://github.com/CRAG666/code_runner.nvim',
    'https://github.com/folke/flash.nvim',
    'https://github.com/lervag/vimtex',
    'https://github.com/L3MON4D3/LuaSnip',
    'https://github.com/jakobkhansen/journal.nvim',
    'https://github.com/ibhagwan/fzf-lua',
    'https://github.com/nvim-mini/mini.statusline',
    'https://github.com/nvim-mini/mini.bufremove',
    'https://github.com/folke/tokyonight.nvim',
})

require "plugins.theme"
require "plugins.statusline"
require "plugins.undotree"
require "plugins.surround"
require "nvim-autopairs".setup()
require "ibl".setup({ indent = { char = "▏" } })
require "plugins.auto-sessions"
require "plugins.textobjects"
require "plugins.fzf"
require "plugins.luasnip"
require "plugins.vimtex"
require "plugins.journal"
require "plugins.coderunner"
require "plugins.flash"
