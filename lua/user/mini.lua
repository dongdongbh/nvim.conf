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

  local starter = require("mini.starter")
  starter.setup({
    evaluate_single = true,
    header = "Welcome back",
    items = {
      starter.sections.recent_files(5, false),
      starter.sections.telescope(),
      {
        name = "New file",
        action = "ene | startinsert",
        section = "Actions",
      },
      {
        name = "Config",
        action = "e $MYVIMRC",
        section = "Actions",
      },
      {
        name = "Quit",
        action = "qa",
        section = "Actions",
      },
    },
    footer = function()
      return os.date("Today is %A, %B %d")
    end,
  })

  local miniclue = require("mini.clue")
  miniclue.setup({
    triggers = {
      { mode = "n", keys = "<Leader>" },
      { mode = "x", keys = "<Leader>" },
      { mode = "n", keys = "g" },
      { mode = "x", keys = "g" },
      { mode = "n", keys = "[" },
      { mode = "x", keys = "[" },
      { mode = "n", keys = "]" },
      { mode = "x", keys = "]" },
      { mode = "n", keys = "z" },
      { mode = "x", keys = "z" },
    },
    clues = {
      miniclue.gen_clues.builtin_completion(),
      miniclue.gen_clues.g(),
      miniclue.gen_clues.marks(),
      miniclue.gen_clues.registers(),
      miniclue.gen_clues.windows(),
      miniclue.gen_clues.z(),
      { mode = "n", keys = "<Leader>", desc = "+leader" },
    },
    window = {
      delay = 0,
      config = {
        width = "auto",
      },
    },
  })
end

return M
