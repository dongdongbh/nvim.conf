local wk = require("which-key")
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

-- telescope mapping
wk.register({
    f = {
        name = "file", -- optional group name
        f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
        g = { "<cmd>Telescope live_grep<cr>", "Live grep" }, -- live grep search a string
        b = { "<cmd>Telescope buffers<cr>", "list open buffers" }, -- buffers
        h = { "<cmd>Telescope help_tags<cr>", "Help tags" }, -- Lists available help tags
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap = false }, -- additional options for creating the keymap
        n = { "New File" }, -- just a label. don't create any mapping
        e = "Edit File", -- same as above
        ["1"] = "which_key_ignore", -- special label to hide it in the popup
    },
}, { prefix = "<leader>" })



-- Add [count] blank lines above/below cursor
map('n', ']<Space>', ":<C-u>put =repeat(nr2char(10),v:count)<Bar>execute \"'[-1\"<CR>", opts)
map('n', '[<Space>', ":<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute \"']+1\"<CR>", opts)

-- force not use arrow keys
map('n', '<Up>', '<NOP>', opts)
map('n', '<Down>', '<NOP>', opts)
map('n', '<Left>', '<NOP>', opts)
map('n', '<Right>', '<NOP>', opts)

-- move line or visually selected block - alt+j/k
map('i', '<A-j>', '<Esc>:m .+1<CR>==gi', opts)
map('i', '<A-k>', '<Esc>:m .-2<CR>==gi', opts)
map('v', '<A-j>', ":m '>+1<CR>gv=gv", opts)
map('v', '<A-k>', ":m '<-2<CR>gv=gv", opts)

-- split map
map('n', '<leader>v', ':vsplit<CR>', opts)
map('n', '<leader>s', ':split<CR>', opts)

-- move split panes to left/bottom/top/right
map('n', '<A-h>', '<C-W>H', opts)
map('n', '<A-j>', '<C-W>J', opts)
map('n', '<A-k>', '<C-W>K', opts)
map('n', '<A-l>', '<C-W>L', opts)

-- move between panes to left/bottom/top/right
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)


-- move between buffers
map('n', '<Leader>n', ':bnext<cr>', opts)
map('n', '<Leader>N', ':bprev<cr>', opts)

-- Avoiding the Esc key
-- Note you can do a normal action by <C-o> in insert mode
--map('i', 'ii', '<Esc>', opts)
map('i', 'jj', '<Esc>', opts)
map('i', '<S-Tab>', '<Esc>', opts)
map('o', '<S-Tab>', '<Esc>', opts)
--map('i', 'jk', '<Esc>', opts)
--map('i', 'kj', '<Esc>', opts)


-- remove search highlighting
-- use double-Esc to completely clear the search buffer
map('n', '<Esc><Esc>', ':let @/ = ""<CR>', opts)
-- Clear last search highlighting
map('n', '<Leader><CR>', ':noh<cr>', opts)




-- Set a key-mapping for copy and pasting to the system clipboard
map('v', '<Leader>y', '"+y', opts)
map('n', '<Leader>p', '"+p', opts)

-- Set key-mapping for dealing with two alphabetical registers easily
-- Two does the work for me, you can set more

map('v', '<Leader>a', '"ay', opts)
map('v', '<Leader>A', '"Ay', opts)
map('n', '<Leader>a', '"ap', opts)
map('n', '<Leader>0', '"0p', opts)


map('v', '<Leader>x', '"xy', opts)
map('v', '<Leader>X', '"Xy', opts)
map('n', '<Leader>x', '"xp', opts)
-- change the word under cursor in down or up direction
map('n', 'c*', "*''cgn", opts)
map('n', 'c#', "#''cgN", opts)

-- cd to parent directory
map('n', '<leader>cd', ":cd %:p:h<CR>", opts)

-- fast macro q
map('n', 'Q', "@q", opts)
map('v', 'Q', ":norm @q<cr>", opts)

-- Uppercase/lowercase current word in insert mode
map('i', ',cu', "<Esc>mzgUiw'za", opts)
map('i', ',cl', "<Esc>mzguiw'za", opts)

-- Bring search results to midscreen
map('n', 'n', "nzzzv", opts)
map('n', 'N', "Nzzzv", opts)

-- shift + dir change tabs
--map('n', '<S-l>', "gt", opts)
--map('n', '<S-h>', "gT", opts)

-- Y to yank to line end
map('n', 'Y', "y$", opts)

-- close current buffer and open previous buffer in same pane
-- this avoid close split pane
map('n', '<C-x>', ":bp<Bar>bd #<CR>", opts)


-- indent and de-indent using tab
--map('n', '<Tab>', '>>', opts)
--map('n', '<S-Tab>', '<<', opts)
--map('v', '<Tab>', '>><Esc>gv', opts)
--map('v', '<Tab>', '>><Esc>gv', opts)

-- After shifting a visual block, select it again
map('v', '<', "<gv", opts)
map('v', '>', ">gv", opts)

-- Reformat whole file
map('n', 'g=', "gg=G''", opts)

-- command mode
map('c', '<C-A>', '<Home>', opts)

-- floaterm keymap
vim.g.floaterm_keymap_new    = '<F7>'
vim.g.floaterm_keymap_prev   = '<F8>'
vim.g.floaterm_keymap_next   = '<F9>'
vim.g.floaterm_keymap_toggle = '<F12>'
-- vim.g.floaterm_keymap_new = '<leader>ft'
vim.g.floaterm_gitcommit     = 'floaterm'
vim.g.floaterm_autoclose     = 1

