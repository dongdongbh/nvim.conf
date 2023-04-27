local M = { "ggandor/leap.nvim",
  event = "Bufenter",
  commit = "98a72ad93c629c49bd7127d342960cc1b159b620",
}

function M.config()
  local status_ok, leap = pcall(require, "leap")
  if not status_ok then
    return
  end
  leap.add_default_mappings()
end

return M
