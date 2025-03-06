local M = {
  "jay-babu/mason-nvim-dap.nvim",
  event = "VeryLazy",
  dependencies = {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-dap",
  }
}


function M.config()
  -- Setup Mason first
  require("mason").setup()

  -- Then setup mason-nvim-dap with the desired adapters to ensure are installed
  require("mason-nvim-dap").setup({
    ensure_installed = { "python", "delve" },
  })
end

return M
