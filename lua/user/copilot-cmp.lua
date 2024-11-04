local M = {
  "zbirenbaum/copilot-cmp",
  event = "InsertEnter",
  dependencies = { "zbirenbaum/copilot.lua" },
}

function M.config()
  require("copilot_cmp").setup {
    method = "getCompletionsCycling",
    formatters = {
      insert_text = require("copilot_cmp.format").remove_existing
    },
  }
end

return M
