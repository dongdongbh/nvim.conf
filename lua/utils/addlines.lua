local M = {}

function M.add_blank_line(direction)
  local count = vim.v.count ~= 0 and vim.v.count or 1
  local pos = vim.api.nvim_win_get_cursor(0)
  local lines = {}
  for i = 1, count do
    table.insert(lines, "")
  end
  if direction == "above" then
    vim.api.nvim_buf_set_lines(0, pos[1] - 1, pos[1] - 1, false, lines)
    vim.api.nvim_win_set_cursor(0, { pos[1] + count, pos[2] })
  elseif direction == "below" then
    vim.api.nvim_buf_set_lines(0, pos[1], pos[1], false, lines)
    vim.api.nvim_win_set_cursor(0, { pos[1], pos[2] })
  end
end

function M.setup()
  vim.api.nvim_set_keymap('n', '[<space>', ':<C-u>lua require("utils.addlines").add_blank_line("above")<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', ']<space>', ':<C-u>lua require("utils.addlines").add_blank_line("below")<CR>', { noremap = true, silent = true })
end

return M

