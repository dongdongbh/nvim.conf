local wk = require("which-key")
local mappings = {
    q = {":q<cr>", "Quit"},
    Q = {":wq<cr>", "Save & Quit"},
    w = {":update<cr>", "Update"},
    x = {":bdelete<cr>", "Close"},
    E = {":e ~/.config/nvim/init.lua<cr>", "Edit nvim config"},
}
local opts = {prefix = '<leader>'}
wk.register(mappings, opts)
