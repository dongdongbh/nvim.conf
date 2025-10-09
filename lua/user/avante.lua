return {
  {
    "yetone/avante.nvim",
    -- Load on command or key press for best performance
    cmd = { "Avante", "AvanteAsk", "AvanteEdit", "AvanteRefresh" },
    enabled = false, -- disabled: plugin currently buggy
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-web-devicons",
      "zbirenbaum/copilot.lua",
      -- UI and UX plugins
      "stevearc/dressing.nvim",         -- Recommended for input UI
      "nvim-telescope/telescope.nvim", -- For file selector
      "hrsh7th/nvim-cmp",              -- For command autocompletion
      -- Optional but nice for viewing images/markdown
      "HakonHarnes/img-clip.nvim",
      "MeanderingProgrammer/render-markdown.nvim",
    },
    opts = {
      -- provider = "copilot",
      -- provider = "gemini",
      -- provider = "openai",
      provider = "claude",

      -- All provider settings now go inside this 'providers' table
      providers = {
        openai = {
          -- 'key' is a plugin setting, so it stays here
          key = os.getenv("OPENAI_API_KEY"),
          -- API parameters like 'model' are now in 'extra_request_body'
          extra_request_body = {
            model = "gpt-5",
            temperature = 1,
          },
        },
        claude = {
          key = os.getenv("ANTHROPIC_API_KEY"),
          extra_request_body = {
            model = "claude-opus-4-1",
            max_tokens = 32000,
          },
        },
        gemini = {
          key = os.getenv("GEMINI_API_KEY"),
          extra_request_body = {
            model = "gemini-2.5-pro",
          },
        },
        copilot = {
          model = "claude-3.5-sonnet"
        },
      },

      -- RECOMMENDED ADDITIONS
      -- 1. Use dressing.nvim for a better input prompt
      input = {
        provider = "dressing",
      },
      -- 2. Use Telescope to select files to include in context
      file_selector = {
        provider = "telescope",
      },
      -- 3. Key mappings to actually use the plugin
      keymaps = {
        ask = "<leader>ca",
        edit = "<leader>ce",
        refresh = "<leader>cr",
      },
    },
    keys = function(_, keys)
      local opts = require("lazy.core.plugin").values(require("lazy.core.config").spec.plugins["avante.nvim"], "opts", false)
      local mappings = {
        {
          opts.keymaps.ask, -- Reads "<leader>ca" from your opts
          function() require("avante.api").ask() end,
          desc = "Avante: Ask",
          mode = { "n", "v" },
        },
        {
          opts.keymaps.refresh, -- Reads "<leader>cr" from your opts
          function() require("avante.api").refresh() end,
          desc = "Avante: Refresh",
          mode = "v",
        },
        {
          opts.keymaps.edit, -- Reads "<leader>ce" from your opts
          function() require("avante.api").edit() end,
          desc = "Avante: Edit",
          mode = { "n", "v" },
        },
      }
      return mappings
    end,
    -- This config function correctly sets up keymaps and cmp
    config = function(_, opts)
      -- Setup the main plugin
      require("avante").setup(opts)

      -- Setup autocompletion with nvim-cmp
      local cmp_ok, cmp = pcall(require, "cmp")
      if cmp_ok then
        cmp.setup.filetype("avante", {
          sources = cmp.config.sources({
            { name = "avante" },
          }),
        })
      end

      -- Setup markdown rendering in Avante buffers
      local render_ok, render_markdown = pcall(require, "render-markdown")
      if render_ok then
        render_markdown.setup({
          file_types = { "markdown", "Avante" },
        })
      end
    end,
  },
}
