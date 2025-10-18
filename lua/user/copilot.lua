local M = {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
}

function M.config()
  require("copilot").setup({
    suggestion = {
      enabled = true,
    },
    panel = { enabled = false },
    filetypes = {
      markdown = true, -- overrides default
      terraform = false, -- disallow specific filetype
    },
  })
end

return M
