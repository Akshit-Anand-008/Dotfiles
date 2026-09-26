vim.pack.add({
    'https://github.com/EdenEast/nightfox.nvim',
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
    'https://github.com/nvim-telescope/telescope.nvim',
    'https://github.com/kylechui/nvim-surround',
    'https://github.com/rmagatti/auto-session',
    'https://github.com/nvim-lualine/lualine.nvim',
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
})

require "plugins.theme"
require "ibl".setup({ indent = { char = "▏" } })
require "nvim-autopairs".setup({})
require "plugins.lualine"
require "plugins.undotree"
require "plugins.auto-sessions"
require "plugins.surround"
require "plugins.textobjects"
require "plugins.telescope"
require "plugins.luasnip"
require "plugins.vimtex"
require "plugins.journal"
require "plugins.coderunner"
require "plugins.flash"
