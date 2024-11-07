local M = {
  "kyazdani42/nvim-tree.lua",
  event = "VimEnter"
}

function M.config()
  require("nvim-tree").setup {
    update_focused_file = {
      enable = true,
      update_cwd = true,
    },
    renderer = {
      icons = {
        glyphs = {
          default = "",
          symlink = "",
          folder = {
            arrow_open = "",
            arrow_closed = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
          },
          git = {
            unstaged = "",
            staged = "S",
            unmerged = "",
            renamed = "➜",
            untracked = "U",
            deleted = "",
            ignored = "◌",
          },
        },
      },
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
      icons = {
        hint = "󰌵",
        info = "",
        warning = "",
        error = "",
      },
    },
    view = {
      width = 30,
      side = "left",
    },
    -- Define custom mappings in the on_attach function
    on_attach = function(bufnr)
      local api = require("nvim-tree.api")

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- Mappings
      vim.keymap.set("n", "l", api.node.open.edit, opts("Edit"))
      vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Edit"))
      vim.keymap.set("n", "o", api.node.open.edit, opts("Edit"))
      vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Node"))
      vim.keymap.set("n", "v", api.node.open.vertical, opts("Open in Vertical Split"))
    end,
  }
end

return M

