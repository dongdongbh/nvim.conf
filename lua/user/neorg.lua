local M = {
  "nvim-neorg/neorg",
  ft = "norg",
  cmd = "Neorg",
  build = ":Neorg sync-parsers",
  dependencies = { { "nvim-lua/plenary.nvim" } },
}

function M.config()
  require('neorg').setup {
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.concealer"] = {}, -- Adds pretty icons to your documents
      ["core.export"] = {}, -- export 
      ["core.keybinds"] = {
        config = {
          default_keybinds = true,
          neorg_leader = ','
        }
      },
      ["core.dirman"] = { -- Manages Neorg workspaces
        config = {
          workspaces = {
            work = "~/Documents/notes/work",
            personal = "~/Document/notes/personal",
          },
          default_workspace = "work",
          index = "index.norg", -- The name of the main (root) .norg file
        },
      },
      ["core.completion"] = {
        config = {
          engine = "nvim-cmp",
          name = "[Neorg]"
        }
      }
    },
  }
end

return M
