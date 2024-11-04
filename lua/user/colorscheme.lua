local M = {
  {"folke/tokyonight.nvim",
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
