local M = {
  "stevearc/conform.nvim",
  event = "BufReadPre",
}

function M.config()
  require("conform").setup({
    formatters_by_ft = {
      -- existing
      lua = { "stylua" },
      python = { "isort", "black" },
      rust = { "rustfmt", lsp_format = "fallback" },
      javascript = { "prettierd", "prettier", stop_after_first = true },

      -- C / C++
      c = { "clang_format" },
      cpp = { "clang_format" },

      -- JSON
      json = { "prettierd" },

      -- Markdown
      markdown = { "prettierd" },

      -- TOML
      toml = { "taplo" },

      -- YAML
      yaml = { "prettierd" },

      -- Shell
      sh = { "shfmt" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback", -- Use LSP if no Conform formatter is found
    },
  })

  -- Set up formatexpr so that Conform can be used as an LSP formatting handler.
  vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

  -- Optional: auto-format on save
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
      require("conform").format({ bufnr = args.buf })
    end,
  })
end

return M
