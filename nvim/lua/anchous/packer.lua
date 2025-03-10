-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use({
        "sainnhe/everforest",
        as = "everforest",
        config = function()
            vim.cmd([[colorscheme everforest]])
        end,
    })

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('ThePrimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    -- LSP
    use {
        "VonHeikemen/lsp-zero.nvim",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            {
                "williamboman/mason.nvim",
                config = function() require("mason").setup() end,
            },
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
        -- Config in after/
    }
    use('nvim-tree/nvim-web-devicons')
    use('ThePrimeagen/vim-be-good')

    -- formatting tools
    use('tell-k/vim-autopep8')
    use('rhysd/vim-clang-format')
    use('neovim/nvim-lspconfig')
    use('simrat39/rust-tools.nvim')
    use('jiangmiao/auto-pairs')
    use('Vimjas/vim-python-pep8-indent')
    use('nvim-lualine/lualine.nvim')
    use('lewis6991/gitsigns.nvim')
    use('numToStr/Comment.nvim')
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })
    use('lukas-reineke/lsp-format.nvim')
    use('norcalli/nvim-colorizer.lua')
    use {
        "startup-nvim/startup.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = function()
            require "startup".setup()
        end
    }
    use('CRAG666/code_runner.nvim')
    use('CRAG666/betterTerm.nvim')
    use('lukas-reineke/indent-blankline.nvim')
    use {
        "max397574/better-escape.nvim",
        config = function()
            require("better_escape").setup()
        end,
    }
    use('simonmclean/triptych.nvim')
    use('vim-scripts/restore_view.vim')
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = {
                "markdown" }
        end,
        ft = { "markdown" },
    })
    use('mfussenegger/nvim-dap')
    use {
        'mfussenegger/nvim-dap-python',
        config = function()
            require("dap-python").setup("python3")
        end,
    }
    use {
        'leoluz/nvim-dap-go',
        config = function()
            require('dap-go').setup()
        end,
    }
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } }
    use {
        "ray-x/lsp_signature.nvim",
    }
end)
