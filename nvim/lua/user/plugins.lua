return {
    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        branch = 'master',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- Colorscheme
    {
        "sainnhe/everforest",
        name = "everforest",
        config = function()
            vim.cmd([[colorscheme everforest]])
        end,
    },

    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            local ok, configs = pcall(require, "nvim-treesitter.configs")
            if not ok then return end

            configs.setup {
                auto_install = true,
                highlight = { enable = true },
                ensure_installed = { "rust", "python", "cpp", "c", "lua", "vim", "vimdoc", "query" },
            }
        end
    },

    -- Core Utils
    'ThePrimeagen/harpoon',
    'mbbill/undotree',
    'tpope/vim-fugitive',
    'nvim-tree/nvim-web-devicons',
    'ThePrimeagen/vim-be-good',

    -- LSP Zero & Mason
    {
        "VonHeikemen/lsp-zero.nvim",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim", config = function() require("mason").setup() end },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
            { "SirVer/ultisnips" },
        }
    },

    -- Formatting & Utilities
    'tell-k/vim-autopep8',
    'rhysd/vim-clang-format',
    'simrat39/rust-tools.nvim',
    'jiangmiao/auto-pairs',
    'Vimjas/vim-python-pep8-indent',
    'nvim-lualine/lualine.nvim',
    'lewis6991/gitsigns.nvim',
    'numToStr/Comment.nvim',
    'lukas-reineke/lsp-format.nvim',
    'norcalli/nvim-colorizer.lua',
    'CRAG666/code_runner.nvim',
    'CRAG666/betterTerm.nvim',
    'lukas-reineke/indent-blankline.nvim',
    'simonmclean/triptych.nvim',
    'vim-scripts/restore_view.vim',
    "ray-x/lsp_signature.nvim",

    -- Nvim Surround
    {
        "kylechui/nvim-surround",
        version = "*", -- Lazy uses `version` instead of `tag`
        config = function()
            require("nvim-surround").setup({})
        end
    },

    -- Startup Screen
    {
        "startup-nvim/startup.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = function()
            require("startup").setup()
        end
    },

    -- Better Escape
    {
        "max397574/better-escape.nvim",
        config = function()
            require("better_escape").setup()
        end,
    },

    -- Markdown Preview
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        init = function() -- Packer `setup` becomes Lazy `init`
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },

    -- Debugging (DAP)
    'mfussenegger/nvim-dap',
    {
        'mfussenegger/nvim-dap-python',
        config = function()
            require("dap-python").setup("python3")
        end,
    },
    {
        'leoluz/nvim-dap-go',
        config = function()
            require('dap-go').setup()
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }
    },
}
