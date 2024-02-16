local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    {
        'nvim-telescope/telescope.nvim',
        cmd = 'Telescope',
        lazy = true,
        dependencies = {
            'andrew-george/telescope-themes',
        },
        config = function()
            local telescope = require('telescope')
            telescope.load_extension('themes')
        end
    },

    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

    { 'folke/zen-mode.nvim' },

    { "ellisonleao/gruvbox.nvim",        priority = 1000 },
    { 'rebelot/kanagawa.nvim' },
    { "catppuccin/nvim",                 name = "catppuccin", priority = 1000 },

    { 'lewis6991/gitsigns.nvim' },

    {
        'NeogitOrg/neogit',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'sindrets/diffview.nvim',
            'nvim-telescope/telescope.nvim',
            'ibhagwan/fzf-lua',
        },
        config = true
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    {
        'numToStr/Comment.nvim',
        lazy = false,
    },

    { 'tpope/vim-dadbod' },

    { "ellisonleao/glow.nvim", config = true, cmd = "Glow" },

    {
        'nvimdev/lspsaga.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons'
        },
    },

    { 'ray-x/web-tools.nvim' },

    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v3.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
            '3rd/image.nvim',
        }
    },

    -- LSP STAFF
    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },
})
