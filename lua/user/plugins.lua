return {
  {
    "tpope/vim-repeat",
    event = "Bufenter",
  },
  {
    "tpope/vim-surround",
    event = "Bufenter",
  },
  {
    "tpope/vim-abolish",
    event = "Bufenter",
  },
  {
    "rrethy/vim-hexokinase",
    build = "make hexokinase",
    event = "VeryLazy",
  }, -- gui color
  {
    "mbbill/undotree",
    event = "Bufenter",
  },
  {
    "christoomey/vim-tmux-navigator",
    event = "Bufenter",
  },
  {
    "lambdalisue/suda.vim",
    cmd = { "SudaWrite", "SudaRead" },
  },
  {
    "junegunn/vim-easy-align",
    event = "Bufenter",
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    event = "Bufenter",
    build = 'make',
    lazy = false,
    init = function()
      require('telescope').load_extension('fzf')
    end,
  },
  {
    "echasnovski/mini.nvim",
    event = "VeryLazy",
  },
  {
    "kevinhwang91/rnvimr",
    event = "VeryLazy",
  }, -- ranger support
  {
    "ThePrimeagen/harpoon",
    event = "Bufenter",
  }, -- harpoon for fast buffer navigation
  {
    "AckslD/nvim-neoclip.lua",
    event = "Bufenter",
    config = function()
      require('neoclip').setup()
    end,
  },
  {
    "sudormrfbin/cheatsheet.nvim",
    cmd = "Cheatsheet",
  },
}
