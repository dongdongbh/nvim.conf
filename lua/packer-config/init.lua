return require'packer'.startup(function()
    use 'wbthomason/packer.nvim'

    use 'morhetz/gruvbox'                                               --theme
    use 'kyazdani42/nvim-web-devicons'                                  --support icons
    use 'kyazdani42/nvim-tree.lua'                                      -- file explore
    use 'voldikss/vim-floaterm'                                         -- float terminal
    use 'rcarriga/nvim-notify'                                          -- nice looking notify
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }        --highlights
    use 'nvim-lualine/lualine.nvim'                                     -- statusline
    use 'preservim/nerdcommenter'                                       -- comment
    use 'tpope/vim-surround'                                            -- surround
    use 'justinmk/vim-sneak'                                            -- search with three letters
    use 'tpope/vim-abolish'                                             -- abolish hard to explain
    use 'rhysd/vim-grammarous'                                          -- grammar check
    use {'jose-elias-alvarez/null-ls.nvim'}                             --formatting
    use "lukas-reineke/indent-blankline.nvim"                           -- adds indentation guides to all lines
    -- which-key
    use {
          "folke/which-key.nvim",
          config = function()
            require("which-key").setup {
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
            }
          end
    }

    use {'windwp/nvim-autopairs',                                       -- auto pair () {} [] "" etc.
        require('nvim-autopairs').setup{}
    }
    -- git 
    use {
      'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup()
      end
    }

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'

    -- Autocomplete
    use {
        'hrsh7th/nvim-cmp',
        requires = {
          'L3MON4D3/LuaSnip',
          'hrsh7th/cmp-nvim-lsp',
          'hrsh7th/cmp-path',
          'hrsh7th/cmp-buffer',
          'saadparwaiz1/cmp_luasnip',
          'rafamadriz/friendly-snippets',
        },
  }

    -- lsp with zero efforts
    --use {
      --'VonHeikemen/lsp-zero.nvim',
      --requires = {
        ---- LSP Support
        --{'neovim/nvim-lspconfig'},
        --{'williamboman/nvim-lsp-installer'},

        ---- Autocompletion
        --{'hrsh7th/nvim-cmp'},
        --{'hrsh7th/cmp-buffer'},
        --{'hrsh7th/cmp-path'},
        --{'saadparwaiz1/cmp_luasnip'},
        --{'hrsh7th/cmp-nvim-lsp'},
        --{'hrsh7th/cmp-nvim-lua'},

        ---- Snippets
        --{'L3MON4D3/LuaSnip'},
        --{'rafamadriz/friendly-snippets'},
      --}
    --}

    -- fast search anything, files, buffers, themes, etcs.
    use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
    --use 'sunjon/shade.nvim'  -- shade inactive windows

end)

