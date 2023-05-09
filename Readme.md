# nvim.conf

My configuration of [neovim](https://neovim.io/), which I modify from [ nvim-basic-ide](https://github.com/LunarVim/nvim-basic-ide).
For more information about usage, please refer to `:h dvim` in neovim with my configuration.

## Steps to setup

1. install neovim 0.9+

2. install Lazy

3. install plugins by Lazy

4. add the server to this list: [servers](https://github.com/dongdongbh/nvim.conf/blob/febfb71e3d5d4939e7fcbc62bf5a9debbc4dea8e/lua/utils/init.lua#L13)
install language server by `:Mason`

5. add treesitter parser in [list](https://github.com/dongdongbh/nvim.conf/blob/febfb71e3d5d4939e7fcbc62bf5a9debbc4dea8e/lua/user/treesitter.lua#L23), 
install treesitter for programe languages by `:TSInstall all`

6. add patch fonts on [Nerd Font compatible font](https://github.com/ryanoasis/nerd-fonts#font-installation)

``` sh
mkdir -p ~/.local/share/fonts
cp xxx.otf ~/.local/share/fonts/
fc-cache -f -v
fc-list | grep "<name-of-font>"
```

7. set terminal font as patched font

8. check health by `:checkhealth`

