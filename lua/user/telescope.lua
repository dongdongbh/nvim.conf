local M = {
  "nvim-telescope/telescope.nvim",
  branch = "master",
  cmd = "Telescope",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>" },
    { "<leader>fp", "<cmd>Telescope projects<CR>" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>" },
    { "<leader>fr", "<cmd>Telescope neoclip<CR>" },
    { "<leader>fc", "<cmd>Cheatsheet<CR>" },
  },
  dependencies = {
    {
      "ahmedkhalf/project.nvim",
      opts = {},
    },
  },
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
  pcall(telescope.load_extension, "projects")
end

return M
