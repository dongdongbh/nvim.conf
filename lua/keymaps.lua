-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
vim.g.mapleader = ","
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- force not use arrow keys
-- keymap("n", "<Up>", "<NOP>", opts)
-- keymap("n", "<Down>", "<NOP>", opts)
-- keymap("n", "<Left>", "<NOP>", opts)
-- keymap("n", "<Right>", "<NOP>", opts)
--
-- keymap("v", "<Up>", "<NOP>", opts)
-- keymap("v", "<Down>", "<NOP>", opts)
-- keymap("v", "<Left>", "<NOP>", opts)
-- keymap("v", "<Right>", "<NOP>", opts)

-- Bring search results to midscreen
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "J", "mzJ`z", opts) --Join lines with cursor stationary

-- conflict with tmux navigate plugin
-- keymap("n", "<C-j>", ":cprev<CR>zz", opts)
-- keymap("n", "<C-k>", ":cnext<CR>zz", opts)

-- break line by ctrl + j
-- keymap("n", "<C-i>", "i<CR><ESC>", opts)
keymap("n", "<C-j>", "i<CR><ESC>", opts)

-- command mode navigate like bash
keymap("c", "<C-a>", ":<Home>", opts)
keymap("c", "<C-e>", ":<End>", opts)

-- change the word under cursor in down or up direction
keymap("n", "c*", "*''cgn", opts)
keymap("n", "c#", "#''cgN", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", "P", opts)
keymap("x", "<Leader>p", '"_dP', opts)

-- delete to blank hole
keymap("n", "<Leader>D", '"_d', opts)
keymap("v", "<Leader>D", '"_d', opts)

-- Y to yank to line end
keymap("n", "Y", "y$", opts)

-- Set key-mapping for dealing with two alphabetical registers easily
-- in visual mode !!!
keymap("v", "<Leader>m", '"my', opts)
keymap("v", "<Leader>M", '"My', opts)
--map("v", "<Leader>x", '"xy', opts)
--map("v", "<Leader>X", '"Xy', opts)

keymap("n", "<Leader>m", '"mp', opts)
keymap("n", "<Leader>M", '"Mp', opts)
-- paste last yanked
keymap("n", "<Leader>0", '"0p', opts)

-- Set a key-mapping for copy to the system clipboard
keymap("v", "<Leader>y", '"+y', opts)
keymap("n", "<Leader>Y", '"+Y', opts)
--map("n", "<Leader>p", '"+p', opts)

-- Insert --
-- I remap Cap key to esc, so dont need this
-- Press jk fast to enter
-- keymap("i", "jk", "<ESC>", opts)

-- Fix last spelling error (repeat.
keymap("i", "<C-s>", "<C-g>u<Esc>[s1z=`]a<C-g>u", opts)

-- Visual --
-- Stay in vision mode after indent, conflict with neorg, set in autocommands
-- keymap("v", "<", "<gv", opts)
-- keymap("v", ">", ">gv", opts)

-- sort lines
keymap("v", "<leader>s", ":sort u", opts)
keymap("v", "<leader>S", ":sort iu", opts)
keymap("n", "<leader>s", "vip:sort u", opts)
keymap("n", "<leader>S", "vip:sort iu", opts)

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- fast macro q
keymap("n", "Q", "@q", opts)
keymap("v", "Q", ":norm @q<cr>", opts)

-- go next or previous error
keymap("n", "<leader>j", ":lprev<CR>zz", opts)
keymap("n", "<leader>k", ":lnext<CR>zz", opts)

-- Reformat whole file
keymap("n", "g=", "gg=G''", opts)

keymap("n", "<leader>e", ":e <C-R>=expand('%:p:h') . '/' <CR>", opts)
keymap("n", "<leader>E", ":tabe <C-R>=expand('%:p:h') . '/' <CR>", opts)
keymap("n", "<leader>.", ":lcd %:p:h", opts)

-- save with sudo in command_mode
-- keymap("c", "W!!", ":w !sudo tee % >/dev/null<Cr>:e!<Cr>", opts)

-- fast add blank lines
keymap("n", "[<space>", ':<C-u>lua require("utils.addlines").add_blank_line("above")<CR>', opts)
keymap("n", "]<space>", ':<C-u>lua require("utils.addlines").add_blank_line("below")<CR>', opts)

-- Plugins --

-- vim-easy-align
keymap("x", "ga", ":EasyAlign<CR>", opts)
keymap("n", "ga", ":EasyAlign<CR>", opts)

-- ranger with Rnvimr
keymap("t", "<M-i>", "<C-\\><C-n>:RnvimrResize<CR>", opts)
keymap("n", "<M-o>", ":RnvimrToggle<CR>", opts)
keymap("t", "<M-o>", "<C-\\><C-n>:RnvimrToggle<CR>", opts)

-- source current lua file
keymap("n", "<leader>r", ":luafile %<CR>", opts)
-- Undo tree
keymap("n", "<leader>u", ":UndotreeToggle<CR>", opts)

-- NvimTree
-- keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- toggleterm
keymap("n", "<leader>$", ":ToggleTerm size=15 dir=%:p direction=horizontal<CR>", opts)
keymap("n", "<leader>!", ":ToggleTerm dir=%:p<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
keymap("n", "<leader>fr", ":Telescope neoclip<CR>", opts)
keymap("n", "<leader>fc", ":Cheatsheet<CR>", opts)

-- Comment
-- keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
-- keymap("x", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- Lsp
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)

-- -- stop cmp in current buffer in 'insert' mode
keymap("i", "<C-x><C-t>", "<Cmd>lua require('cmp').setup.buffer { enabled = false }<CR>", opts)
keymap("i", "<C-x><C-o>", "<Cmd>lua require('cmp').setup.buffer { enabled = ture }<CR>", opts)

-- avoid leap conflict with surround S in visual mode
keymap("v", "-", "<Plug>(leap-forward)", opts)
keymap("v", "_", "<Plug>(leap-backward)", opts)

-- harpoon marker jump
keymap("n", "<M-h>", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", opts)
keymap("n", "<M-l>", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", opts)
keymap("n", "<M-k>", "<cmd>lua require('harpoon.ui').nav_next()<cr>", opts)
keymap("n", "<M-j>", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", opts)
keymap("n", "<M-a>", "<cmd>:lua require('harpoon.mark').add_file()<cr>", opts)
keymap("n", "<M-m>", "<cmd>:lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)

-- Oil file manager
keymap("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory (Oil)" })
