local M = {
  "zbirenbaum/copilot-cmp",
  event = "InsertEnter",
  commit = "99467081478aabe4f1183a19a8ba585e511adc20",
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
