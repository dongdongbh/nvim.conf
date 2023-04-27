local M = { "rmagatti/auto-session",
  lazy = false,
}

function M.config()
  local opts = {
    log_level = 'info',
    auto_session_enable_last_session = false,
    auto_session_suppress_dirs = { "~/", "~/Projects" },
    auto_session_enabled = true,
    auto_save_enabled = true,
    auto_restore_enabled = true,
    auto_session_create_enabled = true,
  }

  require('auto-session').setup(opts)
end

return M
