return {
  settings = {
    -- cmd = {'lua-language-server', '--loglevel=trace'},
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- to avoid lua lsp find multiple location when using stow softlinks
        library = {
          -- [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          -- [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
