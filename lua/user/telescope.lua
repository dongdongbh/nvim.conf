local M = {
  "nvim-telescope/telescope.nvim",
  branch = "master",
  cmd = "Telescope",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Telescope files" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Telescope live grep" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Telescope buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Telescope help tags" },
    { "<leader>fr", "<cmd>Telescope neoclip<CR>", desc = "Telescope neoclip" },
    { "<leader>fc", "<cmd>Cheatsheet<CR>", desc = "Open Cheatsheet" },
  },
  dependencies = {},
}

function M.opts()
  local actions = require "telescope.actions"
  return {
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      path_display = { "smart" },
      file_ignore_patterns = { ".git/", "node_modules" },
      mappings = {
        i = {
          ["<Down>"] = actions.move_selection_next,
          ["<Up>"] = actions.move_selection_previous,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
      },
    },
  }
end

function M.config(_, opts)
  local telescope = require "telescope"
  telescope.setup(opts)
end

return M
