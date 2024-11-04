return {
  { "tpope/vim-repeat",
    event = "Bufenter",
    commit = "24afe922e6a05891756ecf331f39a1f6743d3d5a"
  },
  { "tpope/vim-surround",
    event = "Bufenter",
    commit = "bf3480dc9ae7bea34c78fbba4c65b4548b5b1fea"
  },
  { "tpope/vim-abolish",
    event = "Bufenter",
    commit = "3f0c8faadf0c5b68bcf40785c1c42e3731bfa522"
  },
  { "rrethy/vim-hexokinase",
    commit = "62324b43ea858e268fb70665f7d012ae67690f43",
    build = "make hexokinase",
    event = "VeryLazy",
  },                                      -- gui color
  { "mbbill/undotree",
    event = "Bufenter",
    commit = "bd60cb564e3c3220b35293679669bb77af5f389d"
  },
  { "christoomey/vim-tmux-navigator",
    event = "Bufenter",
    commit = "bd4c38be5b4882991494cf77c0601a55bc45eebf"
  },
  { "lambdalisue/suda.vim",
    cmd = {"SudaWrite", "SudaRead"},
  },
  { "junegunn/vim-easy-align",
    event = "Bufenter",
    commit = "12dd6316974f71ce333e360c0260b4e1f81169c3"
  },
  {'nvim-telescope/telescope-fzf-native.nvim',
    event = "Bufenter",
    build = 'make',
    lazy = false,
    init = function()
      require('telescope').load_extension('fzf')
    end,
  },
  {"kevinhwang91/rnvimr",
    event = "VeryLazy",
    commit = "cd0311d65cb3b8f8737b52f3294eb77d2fcec826"
  }, -- ranger support
  { "wakatime/vim-wakatime",
    event = "VeryLazy",
    disable=true,
    commit = "4692ec3e77ade9e65171182296cca74352a39a12"
  }, -- wakatime work time monitor
  {"ThePrimeagen/harpoon",
    event = "Bufenter",
  }, -- harpoon for fast buffer navigation
  {"AckslD/nvim-neoclip.lua",
    event = "Bufenter",
    lazy = false,
  },
  {"sudormrfbin/cheatsheet.nvim",
    cmd = "Cheatsheet",
  },
}
