local M = {
  'chomosuke/typst-preview.nvim',
  ft = 'typst',
  version = '1.*',
  build = function() require 'typst-preview'.update() end,
}

function M.config()
  vim.keymap.set('n', '<localleader>ll', ':TypstPreviewToggle<CR>', { 
    noremap = true, 
    silent = true, 
    desc = "Toggle Typst Preview",
    buffer = true  -- Local to the buffer
  })

end

return M

