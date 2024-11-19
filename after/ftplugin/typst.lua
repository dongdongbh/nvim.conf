vim.keymap.set('n', '<localleader>ll', ':TypstPreviewToggle<CR>', { 
    noremap = true, 
    silent = true, 
    desc = "Toggle Typst Preview",
    buffer = true  -- Local to the buffer
})
