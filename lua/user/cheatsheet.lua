require("cheatsheet").setup({
  bundled_cheetsheets = {
    enabled = { "default", "regex", "netrw" },
    disabled = { "nerd-fonts" } -- also tried "nerdfonts"
  },
  bundled_plugin_cheatsheets = {
    -- show cheatsheets for all plugins except gitsigns
    disabled = { "gitsigns.nvim" },
  }
})
