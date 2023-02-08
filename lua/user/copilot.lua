require("copilot").setup({
  suggestion = {
    enabled = false,
    auto_trigger = false,
  },
  filetypes = {
    markdown = true, -- overrides default
    terraform = false, -- disallow specific filetype
  },
})

require("copilot_cmp").setup {
  method = "getCompletionsCycling",
  formatters = {
    insert_text = require("copilot_cmp.format").remove_existing
  },
}
