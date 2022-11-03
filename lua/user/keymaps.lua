-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


-- force not use arrow keys
keymap("n", "<Up>", "<NOP>", opts)
keymap("n", "<Down>", "<NOP>", opts)
keymap("n", "<Left>", "<NOP>", opts)
keymap("n", "<Right>", "<NOP>", opts)

keymap("v", "<Up>", "<NOP>", opts)
keymap("v", "<Down>", "<NOP>", opts)
keymap("v", "<Left>", "<NOP>", opts)
keymap("v", "<Right>", "<NOP>", opts)

-- Bring search results to midscreen
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "J", "mzJ`z", opts) --Join lines with cursor stationary

keymap("n", "<C-j>", ":cprev<CR>zz", opts)
keymap("n", "<C-k>", ":cnext<CR>zz", opts)

-- command mode navigate like bash
keymap("c", "<C-a>", ":<Home>", opts)
keymap("c", "<C-e>", ":<End>", opts)

-- change the word under cursor in down or up direction
keymap("n", "c*", "*''cgn", opts)
keymap("n", "c#", "#''cgN", opts)

-- Normal --
-- Better window navigation, I changed to vim-tmux plugin to manage pane switch
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
-- this replaces H, L for moving cursor to top and bottom
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers using bbye plugin
keymap("n", "<C-q>", "<cmd>Bdelete!<CR>", opts)
-- close current buffer and open previous buffer in same pane
-- this avoid close split pane
keymap("n", "<leader>x", ":bp <Bar> bd! #<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)
keymap("x", "<Leader>p", '"_dP', opts)

-- delete to blank hole
keymap("n", "<Leader>d", '"_d', opts)
keymap("v", "<Leader>d", '"_d', opts)

-- Y to yank to line end
keymap("n", "Y", "y$", opts)

-- Set key-mapping for dealing with two alphabetical registers easily
-- in visual mode !!!
keymap("v", "<Leader>a", '"ay', opts)
keymap("v", "<Leader>A", '"Ay', opts)
--map("v", "<Leader>x", '"xy', opts)
--map("v", "<Leader>X", '"Xy', opts)

keymap("n", "<Leader>a", '"ap', opts)
keymap("n", "<Leader>A", '"Ap', opts)
-- paste last yanked
keymap("n", "<Leader>0", '"0p', opts)

-- Set a key-mapping for copy to the system clipboard
keymap("v", "<Leader>y", '"+y', opts)
keymap("n", "<Leader>Y", '"+Y', opts)
--map("n", "<Leader>p", '"+p', opts)

-- Insert --
-- I remap Cap key to esc, so dont need this 
-- Avoiding the Esc key
-- Note you can do a normal action by <C-o> in insert mode
-- Press jk fast to enter
-- keymap("i", "jk", "<ESC>", opts)
-- map("i", "jj", "<Esc>", opts)
-- keymap("i", "<S-Tab>", "<Esc>", opts)

-- Fix last spelling error (repeat.
keymap("i", "<C-s>", "<C-g>u<Esc>[s1z=`]a<C-g>u", opts)


-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- sort lines
keymap("v", "<leader>s", ":sort u", opts)
keymap("v", "<leader>S", ":sort iu", opts)
keymap("n", "<leader>s", "vip:sort u", opts)
keymap("n", "<leader>S", "vip:sort iu", opts)
-- indent and de-indent using tab
--map('n', '<Tab>', '>>', opts)
--map('n', '<S-Tab>', '<<', opts)
--map('v', '<Tab>', '>><Esc>gv', opts)
--map('v', '<Tab>', '>><Esc>gv', opts)

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

-- save with sudo in command_mode
-- keymap("c", "W!!", ":w !sudo tee % >/dev/null<Cr>:e!<Cr>", opts)

-- Plugins --
-- repeat
-- Add [count] blank lines above/below cursor and make it repeatable
--map("n", "]<Space>", ':<C-u>put =repeat(nr2char(10),v:count)<Bar>execute "\'[-1"<CR>', opts)
--map("n", "[<Space>", ':<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute "\']+1"<CR>', opts)
vim.cmd([[
nnoremap <silent> <Plug>AddBlackLineUp :<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute "\']+1"<CR>=:silent! call repeat#set("\<Plug>AddBlackLineUp", v:count)<CR>
nmap [<Space> <Plug>AddBlackLineUp  
nnoremap <silent> <Plug>AddBlackLineDown :<C-u>put =repeat(nr2char(10),v:count)<Bar>execute "\'[-1"<CR>=:silent! call repeat#set("\<Plug>AddBlackLineDown", v:count)<CR>
nmap ]<Space> <Plug>AddBlackLineDown  
]])

-- vim-easy-align
keymap("x", "ga", ":EasyAlign<CR>", opts)
keymap("n", "ga", ":EasyAlign<CR>", opts)

-- Vifm
keymap("n", "<leader>vv", ":Vifm<CR>", opts)
keymap("n", "<leader>vs", ":VsplitVifm<CR>", opts)

-- Undo tree
keymap("n", "<leader>u", ":UndotreeToggle<CR>", opts)

-- NvimTree
-- keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>e", ":e <C-R>=expand('%:p:h') . '/' <CR>", opts)
keymap("n", "<leader>E", ":tabe <C-R>=expand('%:p:h') . '/' <CR>", opts)
keymap("n", "<leader>.", ":lcd %:p:h", opts)

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

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

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

-- -- stop cmp in current buffer in 'insert' mode
keymap("i", "<C-x><C-t>", "<Cmd>lua require('cmp').setup.buffer { enabled = false }<CR>", opts)
keymap("i", "<C-x><C-o>", "<Cmd>lua require('cmp').setup.buffer { enabled = ture }<CR>", opts)
-- avoid leap conflict with surround S in visual mode
keymap("v", "-", "<Plug>(leap-forward)", opts)
keymap("v", "_", "<Plug>(leap-backward)", opts)
