local keymap = vim.keymap.set
local opts = { silent = true }

local status_ok, neogit = pcall(require, "neogit")
if not status_ok then
  return
end

neogit.setup {
  integrations = {
    -- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `sindrets/diffview.nvim`.
    -- The diffview integration enables the diff popup, which is a wrapper around `sindrets/diffview.nvim`.
    diffview = true
  },
}

keymap("n", "<leader>gs", "<cmd> lua require('neogit').open({})<CR>", opts)
keymap("n", "<leader>ga", "<cmd>!git fetch --all<CR>", opts)

