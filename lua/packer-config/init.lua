return require'packer'.startup(function()
    use 'wbthomason/packer.nvim'

    use 'morhetz/gruvbox'               --theme
    use 'kyazdani42/nvim-web-devicons' --support icons
    use 'kyazdani42/nvim-tree.lua'      -- file explore
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }  --highlights
    
    use 'nvim-lualine/lualine.nvim'   -- statusline
    use 'preservim/nerdcommenter' -- comment
    use 'tpope/vim-surround'   -- surround
    use 'justinmk/vim-sneak'   -- search with three letters
    use 'rhysd/vim-grammarous' -- grammar check
    use {'jose-elias-alvarez/null-ls.nvim'} --formatting

    -- git 
    use {
      'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup()
      end
    }
    -- LSP
    use 'neovim/nvim-lspconfig'

    -- Autocomplete
    use {
        'hrsh7th/nvim-cmp',
        requires = {
          'L3MON4D3/LuaSnip',
          'hrsh7th/cmp-nvim-lsp',
          'hrsh7th/cmp-path',
          'hrsh7th/cmp-buffer',
          'saadparwaiz1/cmp_luasnip',
        },
  }

    -- lsp with zero efforts
    use {
      'VonHeikemen/lsp-zero.nvim',
      requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},
        {'williamboman/nvim-lsp-installer'},

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'saadparwaiz1/cmp_luasnip'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-nvim-lua'},

        -- Snippets
        {'L3MON4D3/LuaSnip'},
        {'rafamadriz/friendly-snippets'},
      }
    }

    -- fast search anything, files, buffers, themes, etcs.
    use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
    use 'sunjon/shade.nvim'  -- shade inactive windows

end)

