local M = {
  "lervag/vimtex",
  lazy = false,
  -- ft = "tex",
  -- event = "VimEnter",
}

function M.config()
  vim.cmd('syntax enable')
  -- Enable inverse search with Zathura
  vim.g.vimtex_view_method = 'zathura'
  vim.api.nvim_set_var('maplocalleader', ' ')
end

return M
