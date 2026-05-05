return {
    { "voldikss/vim-floaterm" },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = { indent = { char = "│" } } },
    { "NvChad/nvim-colorizer.lua", opts = { user_default_options = { names = false } } },
    { "nvim-tree/nvim-web-devicons", opts = {} },
    { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
    { "numToStr/Comment.nvim", opts = {} },
    { "kylechui/nvim-surround", version = "*", event = "VeryLazy", opts = {} },
    { "lewis6991/gitsigns.nvim", opts = {} },
    { "echasnovski/mini.move", version = false, opts = {} },
    { "mbbill/undotree" },
    { "folke/persistence.nvim", event = "BufReadPre", opts = {} },
    { "christoomey/vim-tmux-navigator" },
    { "HiPhish/rainbow-delimiters.nvim" },
    { "nvim-lua/plenary.nvim" },
    {
        'mrcjkb/rustaceanvim',
        version = '^9',
        lazy = false,
    },
    {
        'rust-lang/rust.vim',
        ft = "rust",
        init = function()
            vim.g.rustfmt_autosave = 1
        end
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        cmd = "Neotree",
        branch = "v3.x",
        dependencies = { "MunifTanjim/nui.nvim" },
        opts = { filesystem = { follow_current_file = { enabled = true } } },
    },
    {
        "ThePrimeagen/harpoon",
        dependencies = { "nvim-lua/plenary.nvim" },

        config = function()
            require("harpoon").setup()
        end,
    },
}
