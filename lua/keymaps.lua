local keymap = vim.keymap.set
local base_opts = { silent = true }

local function map(mode, lhs, rhs, desc, extra)
  local options = {}
  for k, v in pairs(base_opts) do
    options[k] = v
  end
  if extra then
    for k, v in pairs(extra) do
      options[k] = v
    end
  end
  options.desc = desc
  keymap(mode, lhs, rhs, options)
end

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

map("n", "n", "nzzzv", "Next match centered")
map("n", "N", "Nzzzv", "Previous match centered")

map("n", "<C-u>", "<C-u>zz", "Scroll up half page centered")
map("n", "<C-d>", "<C-d>zz", "Scroll down half page centered")
map("n", "J", "mzJ`z", "Join lines keep cursor")

-- conflict with tmux navigate plugin
-- keymap("n", "<C-j>", ":cprev<CR>zz", opts)
-- keymap("n", "<C-k>", ":cnext<CR>zz", opts)

map("n", "<C-j>", "i<CR><ESC>", "Insert blank line below")

-- command mode navigate like bash
map("c", "<C-a>", ":<Home>", "Command line start")
map("c", "<C-e>", ":<End>", "Command line end")

-- change the word under cursor in down or up direction
map("n", "c*", "*''cgn", "Change next match")
map("n", "c#", "#''cgN", "Change previous match")

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", "Shorter window")
map("n", "<C-Down>", ":resize +2<CR>", "Taller window")
map("n", "<C-Left>", ":vertical resize -2<CR>", "Narrower window")
map("n", "<C-Right>", ":vertical resize +2<CR>", "Wider window")

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>", "Next buffer")
map("n", "<S-h>", ":bprevious<CR>", "Previous buffer")

-- Clear highlights
map("n", "<leader>h", "<cmd>nohlsearch<CR>", "Clear search highlight")

-- Close buffers
map("n", "<S-q>", "<cmd>Bdelete!<CR>", "Force delete buffer")

-- Better paste
map("v", "p", "P", "Paste without yanking")
map("x", "<Leader>p", '"_dP', "Paste replace keep register")

-- delete to blank hole
map("n", "<Leader>D", '"_d', "Delete to void register")
map("v", "<Leader>D", '"_d', "Delete selection to void")

-- Y to yank to line end
map("n", "Y", "y$", "Yank to line end")

-- Set key-mapping for dealing with two alphabetical registers easily
-- in visual mode !!!
map("v", "<Leader>m", '"my', "Yank to register m")
map("v", "<Leader>M", '"My', "Yank to register M")
--map("v", "<Leader>x", '"xy', opts)
--map("v", "<Leader>X", '"Xy', opts)

map("n", "<Leader>m", '"mp', "Paste register m")
map("n", "<Leader>M", '"Mp', "Paste register M")
-- paste last yanked
map("n", "<Leader>0", '"0p', "Paste yank register 0")

-- Set a key-mapping for copy to the system clipboard
map("v", "<Leader>y", '"+y', "Copy selection to clipboard")
map("n", "<Leader>Y", '"+Y', "Copy line to clipboard")
--map("n", "<Leader>p", '"+p', opts)

-- Insert --
-- I remap Cap key to esc, so dont need this
-- Press jk fast to enter
-- keymap("i", "jk", "<ESC>", opts)

-- Fix last spelling error (repeat.
map("i", "<C-s>", "<C-g>u<Esc>[s1z=`]a<C-g>u", "Fix last spelling error")

-- Visual --
-- Stay in vision mode after indent, conflict with neorg, set in autocommands
-- keymap("v", "<", "<gv", opts)
-- keymap("v", ">", ">gv", opts)

-- sort lines
map("v", "<leader>s", ":sort u", "Sort selection unique")
map("v", "<leader>S", ":sort iu", "Sort selection case-ins")
map("n", "<leader>s", "vip:sort u", "Sort paragraph unique")
map("n", "<leader>S", "vip:sort iu", "Sort paragraph case-ins")

-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv", "Move selection down")
map("x", "K", ":move '<-2<CR>gv-gv", "Move selection up")

-- fast macro q
map("n", "Q", "@q", "Replay macro q")
map("v", "Q", ":norm @q<cr>", "Replay macro over selection")

-- go next or previous error
map("n", "<leader>j", ":lprev<CR>zz", "Previous location list")
map("n", "<leader>k", ":lnext<CR>zz", "Next location list")

-- Reformat whole file
map("n", "g=", "gg=G''", "Reindent buffer")

map("n", "<leader>e", ":e <C-R>=expand('%:p:h') . '/' <CR>", "Edit file directory")
map("n", "<leader>E", ":tabe <C-R>=expand('%:p:h') . '/' <CR>", "Tabedit file directory")
map("n", "<leader>.", ":lcd %:p:h", "Set local cwd to file")

-- save with sudo in command_mode
-- keymap("c", "W!!", ":w !sudo tee % >/dev/null<Cr>:e!<Cr>", opts)

-- fast add blank lines
map("n", "[<space>", ':<C-u>lua require("utils.addlines").add_blank_line("above")<CR>', "Blank line above")
map("n", "]<space>", ':<C-u>lua require("utils.addlines").add_blank_line("below")<CR>', "Blank line below")

-- Plugins --

-- vim-easy-align
-- Interactive alignment handled by mini.align default mappings (ga/gA)


-- source current lua file
map("n", "<leader>r", ":luafile %<CR>", "Source current Lua file")

-- NvimTree
-- keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- toggleterm
map("n", "<leader>$", ":ToggleTerm size=15 dir=%:p direction=horizontal<CR>", "Toggle horizontal terminal")
map("n", "<leader>!", ":ToggleTerm dir=%:p<CR>", "Toggle terminal in file dir")

-- Comment
-- keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
-- keymap("x", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)

-- Lsp

-- -- stop cmp in current buffer in 'insert' mode
map("i", "<C-x><C-t>", "<Cmd>lua require('cmp').setup.buffer { enabled = false }<CR>", "Disable CMP buffer")
map("i", "<C-x><C-o>", "<Cmd>lua require('cmp').setup.buffer { enabled = true }<CR>", "Enable CMP buffer")

-- harpoon marker jump
map("n", "<M-h>", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "Harpoon file 1")
map("n", "<M-l>", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "Harpoon file 2")
map("n", "<M-k>", "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Harpoon next")
map("n", "<M-j>", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Harpoon previous")
map("n", "<M-a>", "<cmd>lua require('harpoon.mark').add_file()<cr>", "Harpoon add file")
map("n", "<M-m>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Harpoon quick menu")
