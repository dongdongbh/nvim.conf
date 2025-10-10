# nvim.conf

My configuration of [neovim](https://neovim.io/), which I modify from [ nvim-basic-ide](https://github.com/LunarVim/nvim-basic-ide).
For more information about usage, please refer to `:h dvim` in neovim with my configuration.

## Steps to setup

1. install neovim 0.9+

2. install ueberzugpp, unzip, nodejs, npm

3. install plugins by `Layz sync`

4. add the server to this list: [servers](https://github.com/dongdongbh/nvim.conf/blob/febfb71e3d5d4939e7fcbc62bf5a9debbc4dea8e/lua/utils/init.lua#L13)
install language server by `:Mason`

5. add treesitter parser in [list](https://github.com/dongdongbh/nvim.conf/blob/febfb71e3d5d4939e7fcbc62bf5a9debbc4dea8e/lua/user/treesitter.lua#L23), 
install treesitter for programe languages by `:TSInstall`

6. add patch fonts on [Nerd Font compatible font](https://github.com/ryanoasis/nerd-fonts#font-installation)

``` sh
mkdir -p ~/.local/share/fonts
cp xxx.otf ~/.local/share/fonts/
fc-cache -f -v
fc-list | grep "<name-of-font>"
```

7. set terminal font as patched font

8. check health by `:checkhealth`

## AI-assisted workflow

This config ships with several complementary AI helpers:

- **sidekick.nvim** – drives Copilot “Next Edit Suggestions” and hosts an AI CLI
  terminal. Use `<leader>aa` to open the terminal, `<leader>ap` for the prompt
  picker, and `<Tab>` (in Insert mode) to jump or apply NES edits before
  falling back to cmp completions.
- **copilot.lua** – keeps the Copilot LSP running in the background. Inline
  ghost text is intentionally disabled (`suggestion.enabled = false`) so sidekick
  and cmp own the completion UX. Run `:Copilot auth` once per machine, and
  `:Copilot disable` if you want to pause Copilot entirely.
- **copilot-cmp** – exposes Copilot completions through `nvim-cmp`. They appear
  in the completion menu with the Copilot icon and respect the existing `<CR>`
  / `<Tab>` bindings.
- **mcphub.nvim** – optional command `:MCPHub` to launch a model-context-protocol
  hub for local/remote AI backends. Start it when you need MCP routing; it stays
  out of the way otherwise.

If you ever see overlapping behaviour (multiple tools expanding a `<Tab>` or
opening a chat buffer), prefer sidekick’s bindings and disable the specific
plugin for that buffer (`:Sidekick nes disable`, `:Copilot disable`) to keep the
workflow predictable.
