local M = {
  "nvimtools/none-ls.nvim",
  event = "BufReadPre",
}

function M.config()
  local null_ls = require("null-ls")
  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics

  null_ls.setup({
    debug = false,
    sources = {
      -- Python
      formatting.black, -- Python code formatter
      formatting.isort, -- Python import sorter

      -- Lua
      formatting.stylua, -- Lua code formatter

      -- C/C++
      formatting.clang_format, -- C/C++ formatter
      diagnostics.cppcheck,    -- C/C++ diagnostics

      -- JSON (and similar filetypes)
      formatting.prettier.with({
        filetypes = { "json", "jsonc" },
      }),
    },
  })
end

return M
