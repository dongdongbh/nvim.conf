local M = {
  "nvim-treesitter/nvim-treesitter-context",
  event = "BufRead",
  commit = "0dd5eae6dbf226107da2c2041ffbb695d9e267c1",
  dependencies = {"nvim-treesitter/nvim-treesitter"},
}

function M.config()
  local ts_context = require "treesitter-context"
  ts_context.setup()
end

return M
