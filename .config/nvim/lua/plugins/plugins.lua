return {
    { "voldikss/vim-floaterm" },
    { "nvim-lua/plenary.nvim" },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = { indent = { char = "│" } } },
    { "NvChad/nvim-colorizer.lua", event = "VeryLazy", opts = {} },
    { "nvim-tree/nvim-web-devicons", opts = {} },
    { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
    { "numToStr/Comment.nvim", opts = {} },
    { "kylechui/nvim-surround", opts = {} },
    { "lewis6991/gitsigns.nvim", opts = {} },
    { "echasnovski/mini.move", opts = {} },
    { "mbbill/undotree" },
    { "HiPhish/rainbow-delimiters.nvim" },
    { "mrcjkb/rustaceanvim", ft = { "rust" } },
    { "ThePrimeagen/harpoon", keys = {}, opts = {} },
    { "folke/lazydev.nvim", event = "VeryLazy", opts = {} },
    { "folke/persistence.nvim", event = "BufReadPre", opts = {} }
}
