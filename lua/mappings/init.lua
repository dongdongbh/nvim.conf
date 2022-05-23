local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

-- telescope mapping

map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
map('n', '<leader>fb', ':Telescope buffers<CR>', opts)
map('n', '<leader>fh', ':Telescope help_tags<CR>', opts)


map('n', ']<Space>', ":<C-u>put =repeat(nr2char(10),v:count)<Bar>execute \"'[-1\"<CR>", opts)
map('n', '[<Space>', ":<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute \"']+1\"<CR>", opts)



-- move line or visually selected block - alt+j/k
map('i', '<A-j>', '<Esc>:m .+1<CR>==gi', opts)
map('i', '<A-k>', '<Esc>:m .-2<CR>==gi', opts)
map('v', '<A-j>', ":m '>+1<CR>gv=gv", opts)
map('v', '<A-k>', ":m '<-2<CR>gv=gv", opts)


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


-- Press i to enter insert mode, and ii to exit insert mode.
map('i', 'ii', '<Esc>', opts)


-- remove search highlighting
-- use double-Esc to completely clear the search buffer
map('n', '<Esc><Esc>', ':let @/ = ""<CR>', opts)
-- use space to retain the search buffer and toggle highlighting off/on
map('n', '<Space>', ':set hlsearch!<CR>', opts)
-- Clear last search highlighting
map('n', '<Space>', ':noh<cr>', opts)





-- Set a key-mapping for copy and pasting to the system clipboard
map('v', '<Leader>y', '"+y', opts)
map('n', '<Leader>p', '"+p', opts)
 
-- Set key-mapping for dealing with two alphabetical registers easily
-- Two does the work for me, you can set more
 
map('v', '<Leader>a', '"ay', opts)
map('v', '<Leader>A', '"Ay', opts)
map('n', '<Leader>a', '"ap', opts)


map('v', '<Leader>x', '"xy', opts)
map('v', '<Leader>X', '"Xy', opts)
map('n', '<Leader>x', '"xp', opts)
 
