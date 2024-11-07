local M = {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",  -- New main entry point for version 3
  event = "BufReadPre",
}

M.opts = {
  indent = {
    char = "▏",  -- Formerly g:indent_blankline_char
    tab_char = "│",  -- If you need a specific character for tabs
  },
  whitespace = {
    remove_blankline_trail = true,  -- Remove trailing blankline space if needed
  },
  exclude = {
    filetypes = { "help", "packer", "NvimTree" },  -- Formerly g:indent_blankline_filetype_exclude
    buftypes = { "terminal", "nofile" },  -- Formerly g:indent_blankline_buftype_exclude
  },
  scope = {
    enabled = true,  -- Formerly g:indent_blankline_show_current_context, now enabled by default
    show_start = false,  -- Control whether to show start of scope
    highlight = "IblScope",  -- Use a pre-defined highlight group
  },
}

return M

