local M = {
  "nvim-treesitter/nvim-treesitter-context",
  event = "BufReadPost",
  dependencies = {"nvim-treesitter/nvim-treesitter"},
  commit = "79f2758d470e49061009ccc6f7223b83e0922c66",
}

function M.config()
  local ts_context = require "treesitter-context"
  ts_context.setup()
end

return M
