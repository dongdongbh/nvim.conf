local M = {
  "neovim/nvim-lspconfig",
  lazy = true,
  dependencies = {
    {
      "hrsh7th/cmp-nvim-lsp",
    },
  },
}

local cmp_nvim_lsp = require "cmp_nvim_lsp"
function M.config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

  local function lsp_keymaps(bufnr)
    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
    end

    map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
    map("n", "gd", vim.lsp.buf.definition, "Go to definition")
    map("n", "K", vim.lsp.buf.hover, "Hover docs")
    map("n", "gI", vim.lsp.buf.implementation, "Go to implementation")
    map("n", "gr", vim.lsp.buf.references, "Find references")
    map("n", "gl", vim.diagnostic.open_float, "Line diagnostics")
    map("n", "<leader>li", "<cmd>LspInfo<CR>", "LSP info")
    map("n", "<leader>lI", "<cmd>Mason<CR>", "Open Mason")
    map("n", "<leader>la", vim.lsp.buf.code_action, "Code action")
    map("n", "<leader>lj", function()
      vim.diagnostic.goto_next({ buffer = bufnr })
    end, "Next diagnostic")
    map("n", "<leader>lk", function()
      vim.diagnostic.goto_prev({ buffer = bufnr })
    end, "Prev diagnostic")
    map("n", "<leader>lr", vim.lsp.buf.rename, "Rename symbol")
    map("n", "<leader>ls", vim.lsp.buf.signature_help, "Signature help")
    map("n", "<leader>lq", function()
      vim.diagnostic.setloclist({ open = false })
    end, "Diagnostics loclist")
  end

  local lspconfig = require "lspconfig"
  local on_attach = function(client, bufnr)
    if client.name == "tsserver" then
      client.server_capabilities.documentFormattingProvider = false
    end

    if client.name == "sumneko_lua" then
      client.server_capabilities.documentFormattingProvider = false
    end

    lsp_keymaps(bufnr)
    -- require("illuminate").on_attach(client)
  end

  for _, server in pairs(require("utils").servers) do
    Opts = {
      on_attach = on_attach,
      capabilities = capabilities,
    }

    server = vim.split(server, "@")[1]

    local require_ok, conf_opts = pcall(require, "settings." .. server)
    if require_ok then
      Opts = vim.tbl_deep_extend("force", conf_opts, Opts)
    end

    lspconfig[server].setup(Opts)
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
