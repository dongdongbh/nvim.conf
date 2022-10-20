local colorscheme = "tokyonight-night"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end


local use_catppuccin = 0
if use_catppuccin then
  local status_ok, catppuccin = pcall(require, "catppuccin")
  if not status_ok then
    return
  end
  vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
  catppuccin.setup()
  vim.api.nvim_command "colorscheme catppuccin"
end
