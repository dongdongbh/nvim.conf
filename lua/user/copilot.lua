local M = {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  commit = "a4a37dda9e48986e5d2a90d6a3cbc88fca241dbb",
}

function M.config()
  require("copilot").setup({
    suggestion = {
      enabled = false,
    },
    panel = { enabled = false },
    filetypes = {
      markdown = true, -- overrides default
      terraform = false, -- disallow specific filetype
    },
  })
end

return M
