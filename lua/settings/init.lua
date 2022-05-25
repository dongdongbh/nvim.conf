local set = vim.opt

-- :help options
set.number = true
set.relativenumber = true
set.autoindent = true
set.tabstop = 4
set.shiftwidth = 4
set.smarttab = true
set.softtabstop = 4
set.encoding = "utf-8"

set.showmatch = true -- show matching
set.ignorecase = true -- case insensitive
set.mouse = "a" -- enable mouse click
set.hlsearch = true -- highlight search
set.incsearch = true -- incremental search
set.expandtab = true -- converts tabs to white space
set.cursorline = true -- highlight current cursorline
set.ttyfast = true -- Speed up scrolling in Vim
set.scrolloff = 5
set.splitright = true
set.splitbelow = true
set.termguicolors = true

-- set.wildmode=longest,list   -- get bash-like tab completions
-- set.cc=80                   -- set an 80 column border for good coding style
-- filetype plugin indent on   --allow auto-indenting depending on file type
-- syntax on                   -- syntax highlighting
set.clipboard = unnamedplus -- using system clipboard
-- filetype plugin on
set.spell = true -- enable spell check (may need to download language package)
-- set.swapfile-false            -- disable creating swap file
-- set.backupdir=~/.cache/vim   --" Directory to store backup files.

set.guifont = { "Hack Regular Nerd Font Complete Mono", "h12" }

--vim.cmd([[set iskeyword+=-]])
