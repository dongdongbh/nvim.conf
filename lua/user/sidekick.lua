local M = {
  "folke/sidekick.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
    cli = {
      mux = {
        backend = "zellij",
        enabled = true,
      },
    },
  },
  -- stylua: ignore
  keys = {
    -- {
    --   "<tab>",
    --   function()
    --     -- if there is a next edit, jump to it, otherwise apply it if any
    --     if not require("sidekick").nes_jump_or_apply() then
    --       return "<Tab>" -- fallback to normal tab
    --     end
    --   end,
    --   expr = true,
    --   desc = "Goto/Apply Next Edit Suggestion",
    -- },
    {
      "<leader>aa",
      function() require("sidekick.cli").toggle({ focus = true }) end,
      mode = { "n", "t" },
      desc = "Sidekick Toggle CLI",
    },
    {
      "<leader>as",
      function() require("sidekick.cli").select() end,
      -- Or to select only installed tools:
      -- require("sidekick.cli").select({ filter = { installed = true } })
      desc = "Sidekick Select CLI",
      mode = { "n" },
    },
    {
      "<leader>af",
      function() require("sidekick.cli").send({ msg = "{file}" }) end,
      mode = { "n" },
      desc = "Sidekick Send File",
    },
    {
      "<leader>av",
      function() require("sidekick.cli").send({ msg = "{selection}" }) end,
      mode = { "x" },
      desc = "Sidekick Send Visual Selection",
    },
    {
      "<leader>ap",
      function() require("sidekick.cli").prompt() end,
      mode = { "n", "x" },
      desc = "Sidekick Prompt Picker",
    },
    {
      "<c-.>",
      function() require("sidekick.cli").toggle() end,
      mode = { "n", "x", "i", "t" },
      desc = "Sidekick Toggle CLI Terminal",
    },
    -- Example of a keybinding to open Claude directly
    {
      "<leader>ac",
      function() require("sidekick.cli").toggle({ name = "claude", focus = true }) end,
      desc = "Sidekick Claude Toggle",
      mode = { "n", "t" },
    },
  },
}

return M
