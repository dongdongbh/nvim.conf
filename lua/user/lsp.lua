local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "hrsh7th/cmp-nvim-lsp",
    },
  },
}

local cmp_nvim_lsp = require "cmp_nvim_lsp"

function M.config()
  local base_capabilities = vim.lsp.protocol.make_client_capabilities()
  base_capabilities.textDocument.completion.completionItem.snippetSupport = true
  local capabilities = cmp_nvim_lsp.default_capabilities(base_capabilities)

  local function lsp_keymaps(bufnr)
    local mappings = {
      { "n", "gD", vim.lsp.buf.declaration, "Go to declaration" },
      { "n", "gd", vim.lsp.buf.definition, "Go to definition" },
      { "n", "K", vim.lsp.buf.hover, "Hover docs" },
      { "n", "gI", vim.lsp.buf.implementation, "Go to implementation" },
      { "n", "gr", vim.lsp.buf.references, "Find references" },
      { "n", "gl", vim.diagnostic.open_float, "Line diagnostics" },
      { "n", "<leader>li", "<cmd>LspInfo<CR>", "LSP info" },
      { "n", "<leader>lI", "<cmd>Mason<CR>", "Open Mason" },
      { "n", "<leader>la", vim.lsp.buf.code_action, "Code action" },
      {
        "n",
        "<leader>lf",
        function()
          vim.lsp.buf.format({ async = true })
        end,
        "Format with LSP",
      },
      {
        "n",
        "<leader>lj",
        function()
          vim.diagnostic.goto_next({ buffer = bufnr })
        end,
        "Next diagnostic",
      },
      {
        "n",
        "<leader>lk",
        function()
          vim.diagnostic.goto_prev({ buffer = bufnr })
        end,
        "Prev diagnostic",
      },
      { "n", "<leader>lr", vim.lsp.buf.rename, "Rename symbol" },
      { "n", "<leader>ls", vim.lsp.buf.signature_help, "Signature help" },
      {
        "n",
        "<leader>lq",
        function()
          vim.diagnostic.setloclist({ open = false })
        end,
        "Diagnostics loclist",
      },
    }

    local ok_clue, miniclue = pcall(require, "mini.clue")

    for _, map_def in ipairs(mappings) do
      local mode, lhs, rhs, desc = unpack(map_def)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
      if ok_clue and miniclue.set_mapping_desc then
        miniclue.set_mapping_desc(mode, lhs, desc)
      end
    end

    if ok_clue and miniclue.ensure_buf_triggers then
      miniclue.ensure_buf_triggers(bufnr)
    end
  end

  local on_attach = function(client, bufnr)
    if client.name == "tsserver" then
      client.server_capabilities.documentFormattingProvider = false
    end

    if client.name == "sumneko_lua" or client.name == "lua_ls" then
      client.server_capabilities.documentFormattingProvider = false
    end

    lsp_keymaps(bufnr)
    -- require("illuminate").on_attach(client)
  end

  local servers = require("utils").servers

  for _, entry in ipairs(servers) do
    local server = vim.split(entry, "@")[1]

    local opts = {
      on_attach = on_attach,
      capabilities = capabilities,
    }

    local ok_settings, server_opts = pcall(require, "settings." .. server)
    if ok_settings then
      opts = vim.tbl_deep_extend("force", opts, server_opts)
    end

    vim.lsp.config(server, opts)
    local ok_enable, err = pcall(vim.lsp.enable, server)
    if not ok_enable then
      vim.notify(string.format("Failed to enable LSP server %s: %s", server, err), vim.log.levels.WARN, {
        title = "lsp",
      })
    end
  end
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
      suffix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

return M
