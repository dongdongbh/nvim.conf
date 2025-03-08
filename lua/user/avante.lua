local M = {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- Set this to "*" to always pull the latest release version, or false to update to the latest code changes.
  opts = {
    -- Add your options here. For example:
    provider = "copilotclaude",
    vendors = {
      copilotclaude = {
        __inherited_from = "copilot",
        model = "claude-3.7-sonnet",
        max_tokens = 4096,
      },
    },
    -- provider = "openai",
    -- openai = {
    --   endpoint = "https://api.openai.com/v1",
    --   model = "o3-mini", -- your desired model (or use gpt-4o, etc.)
    --   timeout = 30000, -- timeout in milliseconds
    --   temperature = 0, -- adjust if needed
    --   max_tokens = 4096,
    --   -- reasoning_effort = "high" -- only supported for reasoning models (o1, etc.)
    -- },
  },
  build = "make", -- For building from source. Adjust as needed.
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "echasnovski/mini.pick",         -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua",              -- for file_selector provider fzf
    "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua",        -- for providers='copilot'
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- use_absolute_path = true, -- required for Windows users
        },
      },
    },
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}

function M.config()
  require("avante").setup(M.opts)
end

return M
