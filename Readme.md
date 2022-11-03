# nvim.conf

My configuration of [neovim](https://neovim.io/), which I modify from [ nvim-basic-ide](https://github.com/LunarVim/nvim-basic-ide).

[Setup](#steps-to-setup)

[Usage](#usage)

[Keymaping](#my-keymap)

[Plugins](#plugins)

## steps to setup

1. install neovim 0.8+

2. install packer

3. install plugins by packer

4. install language server by `:Mason`

5. add patch fonts on [Nerd Font compatible font](https://github.com/ryanoasis/nerd-fonts#font-installation)
   
   ```
   mkdir -p ~/.local/share/fonts
   cp xxx.otf ~/.local/share/fonts/
   fc-cache -f -v
   fc-list | grep "<name-of-font>"
   ```

6. set terminal font as patched font

## usage

### basics

see [cheatsheet](https://vim.rtorr.com/) for more.

### close & suspend

`ZZ` save and close, same as `:wq`

`ZQ` close without saving, same as `:q!`

`Ctrl-z` suspend vim and back to terminal, then `fg` urn back to vim

### Move around

`CTRL+u` scroll up half page

`CTRL+d` scroll down half page

`CTRL+b` scroll backward one page

`CTRL+f` scroll forward one page

`H` first line

`M` middle line

`L` bottom line

`zz`- center cursor on screen

`;` repeat previous movement

`.` repeat previous editing

`%` move to related item

`5gg` or `5G` - go to line 5

`W` - jump forwards to the start of a word (words can contain punctuation), useful for numbers.

`^` - jump to the first non-blank character of the line

`J` - **join line** below to the current one with one space in between

### uppercase and lowercase

`~`  - switch case

`g~` - switch case up to motion

`gu` - change to lowercase up to motion

`gU` - change to uppercase up to motion

e.g.
`gUw` : Change to end of current WORD from lower to upper.

`g~~` Toggle case of the current line (same as V~).

`gUU` Change the current line to uppercase (same as VU).

`guu` Change the current line to lowercase (same as Vu).

### about `g`

`gq` word wrap with lone line, e.g. `gqq` wrap current line. `gq3j` wrap three lines.

`gj` and `gk` : Move cursor up and down to wrapped part of a line as if it is a different line. 

`k0` and `g$` : Same as previous but move cursor to the first and last letter of a wrapped line. 

`gq` : Turn a long line into multiple lines. 

`gu` and `gU` : Uncapitalize and capitalize words/lines. 

`~` and `g~` : Switch capitalization of a letter. 

`gf` : Open highlighted text as file. 

`gv` : Reselecting previous selected text. 

`gJ` : Conjoining lines without leaving spaces. 

`g&` : Rerun substitute command for all lines.

`gf` go to file under cursor

`gx` go to link under cursor

### mark

`mx` will mark current place as x, then you can to it latter by ``x`.

### command

run shell command by `:! `, e.g. `:! sort` can sort the lines by shell functions
sort.

another very useful command is `:norm`, this can be great when editing with multiple
lines in visual mode. `:'<,'> norm `, the commands after norm are executed as if it in 
normal mode. use `:norm!` to avoid key maps and just using vim build-in keymaps.
use '^[' as terminal code of `<Esc>`. The way to get it is to type <Ctrl-v><Esc> on
the command line. See :h i_CTRL-V for more info.

### spelling

after `:set spell`, you enabled spell check.

set locally by `:setlocal spell` and `:setlocal spell spelllang=<language>`

`z=` show spell candidates

set spell dictionary by `:set spellfile=~/.vim/spell/en.utf-8.add`

disable spell check by `:set nospell`

`zg` add word under cursor to word list(dict)

  `zG` and word under cursor to internal word list

### Jump

`<C-^>` Alternate buffer

`Ctrl + i` - go to newer position in jump list

`Ctrl + o` - go to older position in jump list

### insert mode & completion

`ctrl+h` delete character before cursor

`ctrl+w` delete word before cursor

`ctrl+t` indent

`ctrl+d` de-indent

`ctrl+rx` insert the contents of register x

`ctrl+a` insert text from register '.', which saves the last text that typed 
in last insert mode. 

`ctrl+p` show the completion menu.

`ctrl+x` special completion mode:

* `ctrl+]` tag
* `ctrl+p` pull from previous context
* `ctrl+n` pull from next context
* `ctrl+f` file name
* `ctrl-line` line
* `ctrl+o` omnicompletion
* if you use `cmp` plug, see it's key binding for insert mode.
* use `:set complete` to change the completion source.
* in command mode use `^` to refer `ctrl+`.

`ctrl+ox` Temporarily enter normal mode to issue **one** normal-mode command x

### indent

`>>`  - indent (move right) line one shiftwidth

`<<` - de-indent (move left) line one shiftwidth

`>%` - indent a block with () or {} (cursor on brace)

`>ib` - indent inner block with ()

### Search

`/` search forward 

`?` search backward 

`*` search current word forward

`#` search current word backward

`\vpattern` 'very magic' pattern: non-alphanumeric characters are interpreted as special regex symbols (no escaping needed)

`n` repeat search in same direction

`:vim[grep] /pattern/ {`{file}`}` - search for pattern in multiple files

### undo

`:e!` back to the state when the file open

### fold

`zf` - manually define a fold up to motion

`zd` - delete fold under the cursor

`za` - toggle fold under the cursor

`zo` - open fold under the cursor

`zc` - close fold under the cursor

`zr` - reduce (open) all folds by one level

`zm` - fold more (close) all folds by one level

`zi` - toggle folding functionality

### window navigate

Ctrl + w, then

`v` vsplit

`s` horizontal

`h` go to left window

`l` go to right window

`j` go to down window

`k` go to up window

`w` switch window

`x` exchange current window with next one

`q` quit window

`SHIFT + ‘>’` increase width to right

`SHIFT + ‘<’` increase width to left

`SHIFT + ‘+’` increase height

`-` decrease height

`=` equal height

### buffer

`:ls` list buffers

`bd` remove buffer

`bnext` next buff

`b xxx` to buffer named xxx

### project management

if there are several project, `vim session` can be used. or just use tmux session to manage.

if there is only one project, you want to jump between code or files. there are many methods.

* use `ctags`, then jump with `ctrl+]`, `ctrl+t`, `ctrl+o`, `ctrl+i`, to go implementation. for more, ref `:help tags`.`:find` also can navigate to files.
* use `lsp` to go definition, reference, declaration, etc., showing diagnose, formating, hover, etc. and `null-ls` enhance `lsp`.
* there also has fussy finder like `telescope` can do a lot about navigation.
* `nerdtree` do have a file explore, but isn't handy and fast for navigation.
* for buffers, `barbar` is a plugin for it, and using vim native buffer command is also convenient.
* for auto completion, there is `lsp-cmp`.

### other useful tricks

**macro and auto number**

In normal mode, typing `Ctrl-A` will increment the next number, and typing `Ctrl-X` will decrement the next number.
The `nrformats` option defaults to `octal,hex`. Use :set nrformats? to view the current options, or `:set nrformats+=alpha` to add the alpha option.

In visual mode, `Ctrl-a` increase `n` to every line, and `g Ctrl-a` add N to number in highlighted text.

`num+@q` repeat macro num times
macro on multiple lines

```
:5,10norm! @q
:%norm! @q
:g/pattern/norm! @q
:norm! @q   # in visual mode
```

In vim, pattern using regex experssion to match.

### keymap check

check keybinding and help

```vim
:help index 
:redir! > vim_maps.txt
:map
:map!
:redir END

:vmap
:nmap
:imap
:map xxx
:scriptnames
:if mapcheck("\<CR>", "I") == "" |echo "no mapping"
```

help
`:help w` − normal mode mapping for w (case-sensitive);

`:help g8` − normal mode mapping for g8;

`:help v_o` − visual mode mapping for o; other modes are c for command-line and i for insert;

`:help CTRL-W` − normal mode mapping for <C-w>;

`:help i_CTRL-W` − insert mode mapping for <C-w>;

`:help  CTRL-W_CTRL-I` − normal mode mapping for <C-w><C-i>;

`:help i_CTRL-G_<Down>` − insert mode mapping for <C-g><Down>.

## my keymap

```lua
-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- change the word under cursor in down or up direction
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
-- Avoiding the Esc key
-- Note you can do a normal action by <C-o> in insert mode
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
-- map("i", "jj", "<Esc>", opts)
keymap("i", "<S-Tab>", "<Esc>", opts)
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
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

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
```

## plugins

### [surround](https://github.com/tpope/vim-surround)

`ds` remove surround

`cs` change surround

`ys` add surround

`yss` add surround to entire line

in visual select mode, use `S` + surround symbols

### [Comment.nvim](https://github.com/numToStr/Comment.nvim)

- NORMAL mode

```help
`gcc` - Toggles the current line using linewise comment
`gbc` - Toggles the current line using blockwise comment
`[count]gcc` - Toggles the number of line given as a prefix-count using linewise
`[count]gbc` - Toggles the number of line given as a prefix-count using blockwise
`gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment
`gb[count]{motion}` - (Op-pending) Toggles the region using blockwise comment
```

- VISUAL mode

```help
`gc` - Toggles the region using linewise comment
`gb` - Toggles the region using blockwise comment
```

### [leap.vim](https://github.com/ggandor/leap.nvim)

a fast search plugin, similar to sneak.vim, easy motion.

Initiate the search in the forward (s) or backward (S) direction,
or in the other windows (gs).

`cl` is equivalent to `s`, and `cc` is equivalent to `S`

### [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)

```lua
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
```

### [nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer)

attach installed lsp server by adding server name in `/lua/lsp/init.lua`.

### [lsp](https://github.com/neovim/nvim-lspconfig#keybindings-and-completion)

```lua
    keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
    keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
    keymap(bufnr, "n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
    keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
    keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
    keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
    keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
    keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
```

### [null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim)

`null-ls` is a tool to extend services for lsp, such as linter, formating, diagnose and code action tools.

not that these tools should be installed on your computer then add them to `null-ls.lua` setting.

### [undotree](https://github.com/mbbill/undotree)

show undo tree

map("n", "<leader>u", ":UndotreeToggle<CR>", opts)

### [Neogit](https://github.com/TimUntersberger/neogit)

```vim
:Neogit " uses tab
:Neogit kind=<kind> " override kind
:Neogit cwd=<cwd> " override cwd
:Neogit commit" open commit popup
```

With diffview integration enabled
| d | Open `diffview.nvim` at hovered file |
| D (TODO) | Open diff popup |

```lua
keymap("n", "<leader>gs", "<cmd> lua require('neogit').open({})<CR>", opts)
keymap("n", "<leader>ga", "<cmd>!git fetch --all<CR>", opts)
```

### [Diffview.nvim](https://github.com/sindrets/diffview.nvim)

`:DiffviewOpen [git rev] [options] [ -- {paths...}]`

`:[range]DiffviewFileHistory [paths] [options]`

### [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)

* `<ctrl-h>` => Left
* `<ctrl-j>` => Down
* `<ctrl-k>` => Up
* `<ctrl-l>` => Right
* `<ctrl-\>` => Previous split

**Note** - you don't need to use your tmux `prefix` key sequence before using
the mappings.

### [vim-abolish](https://github.com/tpope/vim-abolish)

three functions

1. Abbreviation
   
   you may misspell `seperate` to `separate`, you can use
   
   ```vim
   :iabbrev  seperate  separate
   ```
   
   But it not covers all cases, e.g. `Seperate Separate`, `SEPERATE SEPARATE` etc.
   
   ```vim
   :Abolish {despa,sepe}rat{e,es,ed,ing,ely,ion,ions,or}  {despe,sepa}rat{}
   ```

2. Substitution
   
   ```vim
   :%Subvert/facilit{y,ies}/building{,s}/g
   :Subvert/address{,es}/reference{,s}/g
   :Subvert/blog{,s}/post{,s}/g
   :Subvert/child{,ren}/adult{,s}/g
   :Subvert/di{e,ce}/spinner{,s}/g
   ```

3. Coercion
   Want to turn `fooBar` into `foo_bar`? Press `crs` (coerce to snake_case).
   MixedCase (`crm`), camelCase (`crc`), snake_case (`crs`), UPPER_CASE (`cru`),
   dash-case (`cr-`), dot.case (`cr.`), space case (`cr<space>`),
   and Title Case (`crt`) are all just 3 keystrokes away.

### [vim-grammarous](https://github.com/rhysd/vim-grammarous)

:GrammarousCheck
