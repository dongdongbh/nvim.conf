-- ~/.config/nvim/lua/plugins/mcphub.lua

local M = {
  {
    "ravitemer/mcphub.nvim",
    -- It's a good practice to lazy-load on a command or event
    cmd = "MCPHub",
    dependencies = { "nvim-lua/plenary.nvim" },
    -- This build step requires Node.js and npm to be installed on your system
    build = "npm install -g mcp-hub@latest",
    -- Using opts = {} is a clean way to pass an empty setup table.
    -- You can add any mcphub options here in the future.
    opts = {},
  },
  -- It's good practice to ensure dependencies are explicitly listed
  -- in your plugin manager, even if another plugin requires them.
  { "nvim-lua/plenary.nvim", lazy = true },
}

return M
