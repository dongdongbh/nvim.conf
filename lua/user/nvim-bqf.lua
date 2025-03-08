local M = {
  "kevinhwang91/nvim-bqf",
  ft = "qf",
  -- Optional dependencies for best experience:
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
    },
  },
}

function M.config()
  -- Minimal config; just use bqf defaults
  require("bqf").setup()
end

return M
