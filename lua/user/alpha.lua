local M = {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}

function M.config()
  local alpha = require "alpha"
  local dashboard = require "alpha.themes.dashboard"

  dashboard.section.header.val = {
    [[       __                      __                  __    __  ]],
    [[  ____/ /___  ____  ____ _____/ /___  ____  ____ _/ /_  / /_ ]],
    [[ / __  / __ \/ __ \/ __ `/ __  / __ \/ __ \/ __ `/ __ \/ __ \]],
    [[/ /_/ / /_/ / / / / /_/ / /_/ / /_/ / / / / /_/ / /_/ / / / /]],
    [[\__,_/\____/_/ /_/\__, /\__,_/\____/_/ /_/\__, /_.___/_/ /_/ ]],
    [[                 /____/                  /____/              ]],
  }

  dashboard.section.buttons.val = {
    dashboard.button("f", "  Find file", ":lua require('telescope.builtin').find_files({})<CR>"),
    dashboard.button("e", "  New file", ":ene | startinsert<CR>"),
    dashboard.button("w", "  Norg workspace", ":Neorg index<CR>"),
    dashboard.button("a", "  Org agenda", ":Org agenda<CR>"),
    dashboard.button("r", "󰄉  Recent files", ":lua require('telescope.builtin').oldfiles({})<CR>"),
    dashboard.button("c", "  Config", ":e $MYVIMRC<CR>"),
    dashboard.button("q", "  Quit", ":qa<CR>"),
  }

  dashboard.section.footer.val = "dongdongbh.tech"
  dashboard.section.footer.opts.hl = "Type"
  dashboard.section.header.opts.hl = "Include"
  dashboard.section.buttons.opts.hl = "Keyword"

  dashboard.opts.opts.noautocmd = true
  alpha.setup(dashboard.opts)
end

return M
