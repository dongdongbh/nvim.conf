local M = {
  {"folke/tokyonight.nvim",
    commit = "e52c41314e83232840d6970e6b072f9fba242eb9",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    enabled = false;
    config = function()
      local status_ok, _ = pcall(vim.cmd.colorscheme, "tokyonight-night")
      if not status_ok then
        return
      end
    end
  },
  { "catppuccin/nvim",
    commit = "56604126c671aac3bebd6a33c9d1c55ac9359ce1",
    name = "catppuccin",
    enabled = true;
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
      local status_ok, _ = pcall(vim.cmd.colorscheme, "catppuccin")
      if not status_ok then
        return
      end
    end
  },
}

M.name = "catppuccin"

return M
