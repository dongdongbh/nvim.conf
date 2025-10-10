return {
  {
    "tpope/vim-repeat",
    event = "Bufenter",
  },
  {
    "tpope/vim-abolish",
    event = "Bufenter",
  },
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
