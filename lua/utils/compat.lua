local M = {}

local original_notify = vim.notify
vim.notify = function(msg, level, opts)
  if type(msg) == "string" then
    local suppressed = {
      "vim%.lsp%.get_active_clients%(%) is deprecated",
      "vim%.lsp%.buf_get_clients%(%) is deprecated",
      "client%.is_stopped is deprecated",
      "vim%.validate is deprecated",
    }
    for _, pattern in ipairs(suppressed) do
      if msg:match(pattern) then
        return
      end
    end
  end
  return original_notify(msg, level, opts)
end

local function patch_lsp()
  local ok, lsp = pcall(require, "vim.lsp")
  if not ok then
    return
  end
  if lsp.get_clients and lsp.get_active_clients then
    local get_clients = lsp.get_clients
    ---@diagnostic disable-next-line: duplicate-set-field
    lsp.get_active_clients = function(opts)
      return get_clients(opts)
    end
  end
  if lsp.get_clients and lsp.buf_get_clients then
    ---@diagnostic disable-next-line: duplicate-set-field
    lsp.buf_get_clients = function(bufnr)
      return lsp.get_clients({ bufnr = bufnr })
    end
  end
end

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  once = true,
  callback = patch_lsp,
})

return M
