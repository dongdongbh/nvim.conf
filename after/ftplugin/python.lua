local vo = vim.opt_local
vo.tabstop = 4
vo.shiftwidth = 4
vo.softtabstop = 4

local opts = { silent = true }
vim.g.python3_host_prog = "/usr/bin/python3"
vim.keymap.set("n", "<leader>r", ":w<CR>:vsp<CR>:term python3 '%:p'<CR><C-\\><C-n>", opts)

