local use_catppuccin = true
local use_tokyonight = false

-- tokyonight-night
-- tokyonight-storm
-- tokyonight-day
-- tokyonight-moon
if use_tokyonight then
  local status_ok, _ = pcall(vim.cmd, "colorscheme " .. "tokyonight")
  if not status_ok then
    print("error")
    return
  end
end

if use_catppuccin then
  local status_ok, catppuccin = pcall(require, "catppuccin")
  if not status_ok then
    return
  end
  vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
  catppuccin.setup()
  vim.api.nvim_command "colorscheme catppuccin"
end
