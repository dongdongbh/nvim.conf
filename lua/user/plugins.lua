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
    commit = "2fc45dc4bcafb245b613ebd6847a244924735cc6"
  },
  { "junegunn/vim-easy-align",
    event = "Bufenter",
    commit = "12dd6316974f71ce333e360c0260b4e1f81169c3"
  },
  {"kevinhwang91/rnvimr",
    event = "VeryLazy",
    commit = "cd0311d65cb3b8f8737b52f3294eb77d2fcec826"
  }, -- ranger support
  {"ThePrimeagen/harpoon",
    event = "Bufenter",
    commit = "f7040fd0c44e7a4010369136547de5604b9c22a1"
  }, -- harpoon for fast buffer navigation
  {"AckslD/nvim-neoclip.lua",
    event = "Bufenter",
    lazy = false,
    commit = "5b9286a40ea2020352280caeb713515badb03d99"
  },
}
