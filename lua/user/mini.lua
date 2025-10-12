local M = {
  "echasnovski/mini.nvim",
  event = "VeryLazy",
}

function M.config()
  require("mini.ai").setup()
  require("mini.align").setup()

  require("mini.comment").setup()

  require("mini.surround").setup({
    mappings = {
      add = "ys",
      delete = "ds",
      replace = "cs",
      find = "",
      highlight = "",
      update_n_lines = "",
      suffix_last = "l",
      suffix_next = "n",
    },
  })

  require("mini.jump2d").setup({
    mappings = {
      start_jumping = "s",
    },
    view = {
      dim = true,
      n_steps_ahead = 0,
    },
  })

  require("mini.indentscope").setup({
    symbol = "|",
    options = { try_as_border = true },
  })

  local icons_ok, mini_icons = pcall(require, "mini.icons")
  if icons_ok then
    mini_icons.setup()
  end

  require("mini.statusline").setup({
    use_icons = icons_ok,
    set_vim_settings = false,
  })

  require("mini.hipatterns").setup({
    highlighters = {
      hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
    },
  })

  -- mini.starter intentionally disabled (Alpha handles start screen)

  local miniclue = require("mini.clue")

  local triggers = {}

  for _, key in ipairs({ '<Leader>', 'g', '[', ']', 'z', '"', "'", '`' }) do
    table.insert(triggers, { mode = 'n', keys = key })
    table.insert(triggers, { mode = 'x', keys = key })
  end

  table.insert(triggers, { mode = 'n', keys = '<C-w>' })
  table.insert(triggers, { mode = 'i', keys = '<C-x>' })
  table.insert(triggers, { mode = 'c', keys = '<C-r>' })

  -- Pass the fully built table to the setup function
  miniclue.setup({
    triggers = triggers,
    clues = {
      miniclue.gen_clues.builtin_completion(),
      miniclue.gen_clues.g(),
      miniclue.gen_clues.marks(),
      miniclue.gen_clues.registers(),
      miniclue.gen_clues.windows(),
      miniclue.gen_clues.z(),
      { mode = "n", keys = "<Leader>l", desc = "+lsp" },
      { mode = "n", keys = "<Leader>o", desc = "+orgmode" },
      { mode = "n", keys = "<Leader>f", desc = "+telescope" },
      { mode = "n", keys = "<Leader>a", desc = "+sidekick" },
    },
    window = {
      delay = 50, -- Set a small delay for a smoother feel
      config = {
        width = 'auto',
        border = 'rounded',
        title = 'mini.clue',
        title_pos = 'center',
      },
    },
  })
end

return M
