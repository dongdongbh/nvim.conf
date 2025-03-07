local M = {
  "ggandor/leap.nvim",
  event = "BufEnter",
}

function M.config()
  local status_ok, leap = pcall(require, "leap")
  if not status_ok then
    return
  end
  leap.add_default_mappings()
end

return M
