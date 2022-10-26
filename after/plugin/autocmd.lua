local format_group = vim.api.nvim_create_augroup("FormatGroup", { clear = true })

-- auto format when save
-- vim.api.nvim_create_autocmd("BufWritePost", { pattern = "*", command = "FormatWrite", group = format_group })

--open folds when opening
vim.api.nvim_create_autocmd(
  { "BufReadPost", "FileReadPost" },
  { pattern = "*", command = "normal zR", group = format_group }
)
