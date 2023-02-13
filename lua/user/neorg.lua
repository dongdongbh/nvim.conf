require('neorg').setup {
  load = {
    ["core.defaults"] = {}, -- Loads default behaviour
    ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
    ["core.export"] = {}, -- export 
    ["core.keybinds"] = {
      config = {
        default_keybinds = true,
        neorg_leader = ','
      }
    },
    ["core.norg.dirman"] = { -- Manages Neorg workspaces
      config = {
        workspaces = {
          work = "~/Documents/notes/work",
          personal = "~/Document/notes/personal",
        },
        index = "index.norg", -- The name of the main (root) .norg file
      },
    },
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp",
        name = "[Neorg]"
      }
    }
  },
}
