
-- This file can be loaded by calling `lua require('plugins')` from your init.vim
--
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'


    -- Plugins
    -- --------------------------------------------------
    -- Own plugins
    -- --------------------------------------------------


    -- --------------------------------------------------
    -- Colorschemes
    -- --------------------------------------------------
    use 'rose-pine/neovim'

    -- Show color - Edit colorschemes
    use 'norcalli/nvim-colorizer.lua'


    --------------------------------------------------
    -- lualine
    -- --------------------------------------------------
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }


    -- --------------------------------------------------
    -- Gitsigns
    -- --------------------------------------------------
    use 'lewis6991/gitsigns.nvim'


    -- --------------------------------------------------
    -- Fuzzy search
    -- --------------------------------------------------
    -- Harpoon
    use 'ThePrimeagen/harpoon'

    -- Telescope - Fuzzy Finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }


    -- --------------------------------------------------
    -- Treesitter
    -- --------------------------------------------------
    use ({'nvim-treesitter/nvim-treesitter',{run = ':TSUpdate'} })


    -- --------------------------------------------------
    -- LSP - Language Server Protocol - Autocompletion
    -- --------------------------------------------------
    use {
        'neovim/nvim-lspconfig',
        requires = {
            { "williamboman/mason-lspconfig.nvim" },
            { "williamboman/mason.nvim",
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        },
    }


    -- --------------------------------------------------
    -- DAP - Debug Adapter Protocol (Dap)
    -- --------------------------------------------------
    use 'mfussenegger/nvim-dap'
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }


    -- Install debugAdapter
    -- lua
    use 'jbyuki/one-small-step-for-vimkind'

    -- python
    use 'mfussenegger/nvim-dap-python'

end)
