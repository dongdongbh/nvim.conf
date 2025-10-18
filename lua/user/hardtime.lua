local M = {
  "m4xshen/hardtime.nvim",
  lazy = false,
  dependencies = { "MunifTanjim/nui.nvim" },
  opts = {},
}

function M.config(_, opts)
  require("hardtime").setup(opts)
  vim.o.showmode = false -- let Hardtime show mode hints without Neovim status text
end

return M
