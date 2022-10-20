local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  return
end

wk.setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}
