local M = {
  "stevearc/oil.nvim",
  cmd = "Oil",
  keys = {
    { "-", "<CMD>Oil<CR>", desc = "Open parent directory (Oil)" },
    { "<leader>o", "<CMD>Oil<CR>", desc = "Oil Files" },
  },
  opts = {},
}

function M.config()
  require("oil").setup(M.opts)
end

return M
