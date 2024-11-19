local M = {
  "nvim-neorg/neorg",
  -- lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  version = "*", -- Pin Neorg to the latest stable release
  config = true,
  ft = "norg",
  cmd = "Neorg",
}

function M.config()
  require('neorg').setup {
    load = {
      ["core.defaults"] = {},
      ["core.concealer"] = {},
      ["core.keybinds"] = {
        config = {
          default_keybinds = true,
          neorg_leader = ' ',
        }
      },
      ["core.dirman"] = {
        config = {
          workspaces = {
            work = "~/Documents/notes/work",
            personal = "~/Documents/notes/personal",
            course = "~/Documents/notes/course",
            research = "~/Documents/notes/research",
          },
          default_workspace = "research",
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
