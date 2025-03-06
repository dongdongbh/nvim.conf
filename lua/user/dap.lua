local M = {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  enabled = true;
  dependencies = {
    "theHamsta/nvim-dap-virtual-text",
  },
}

local function get_python_path()
  local conda_prefix = os.getenv("CONDA_PREFIX")
  local python_path = "python"
  if conda_prefix then
    python_path = conda_prefix .. "/bin/python"
  end
  -- vim.notify("DAP is using Python path: " .. python_path)
  return python_path
end


function M.config()
  require("nvim-dap-virtual-text").setup()

  local dap = require "dap"

  local dap_ui_status_ok, dapui = pcall(require, "dapui")
  if not dap_ui_status_ok then
    return
  end

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end

  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end

  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end

  dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
      -- provide the absolute path for `codelldb` command if not using the one installed using `mason.nvim`
      command = "codelldb",
      args = { "--port", "${port}" },
      -- On windows you may have to uncomment this:
      -- detached = false,
    },
  }
  dap.adapters.python = {
    type = "executable",
    command = "python",
    args = { "-m", "debugpy.adapter" },
  }
  dap.configurations.c = {
    {
      name = "Launch file",
      type = "codelldb",
      request = "launch",
      program = function()
        local path
        vim.ui.input({ prompt = "Path to executable: ", default = vim.loop.cwd() .. "/build/" }, function(input)
          path = input
        end)
        vim.cmd [[redraw]]
        return path
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
    },
  }
  dap.configurations.python = {
    {
      type = "python",
      request = "launch",
      name = "Launch file (conda)",
      program = "${file}",
      pythonPath = get_python_path,
    },
  }
end


return M
