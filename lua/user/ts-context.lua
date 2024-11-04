local M = {
  "nvim-treesitter/nvim-treesitter-context",
  event = "BufReadPost",
  dependencies = {"nvim-treesitter/nvim-treesitter"},
}

function M.config()
  local ts_context = require "treesitter-context"
  ts_context.setup()
end

return M
