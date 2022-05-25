-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function()
	use("wbthomason/packer.nvim") -- All the lua functions I don't want to write twice
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

	use("morhetz/gruvbox") --theme
	use("kyazdani42/nvim-web-devicons") --support icons
	use("kyazdani42/nvim-tree.lua") -- file explore
	use("voldikss/vim-floaterm") -- float terminal
	use("rcarriga/nvim-notify") -- nice looking notify
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) --highlights
	use("nvim-lualine/lualine.nvim") -- statusline
	use("romgrk/barbar.nvim") -- tab bar
	use("preservim/nerdcommenter") -- comment
	use("tpope/vim-surround") -- surround
	use("justinmk/vim-sneak") -- search with three letters
	use("tpope/vim-abolish") -- abolish hard to explain
	use("rhysd/vim-grammarous") -- grammar check
	use({ "jose-elias-alvarez/null-ls.nvim" }) --formatting
	use("lukas-reineke/indent-blankline.nvim") -- adds indentation guides to all lines
	-- which-key
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	use({
		"windwp/nvim-autopairs", -- auto pair () {} [] "" etc.
		require("nvim-autopairs").setup({}),
	})
	-- show git change sign in left
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})

	---- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")

	---- Autocomplete
	---- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lua") -- cmo for nvim lua configs
	use("hrsh7th/cmp-nvim-lsp") -- support completion from lsp

	---- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- lsp with zero efforts
	--use {
	--'VonHeikemen/lsp-zero.nvim',
	--requires = {
	---- LSP Support
	--{'neovim/nvim-lspconfig'},
	--{'williamboman/nvim-lsp-installer'},

	---- Autocompletion
	--{'hrsh7th/nvim-cmp'},
	--{'hrsh7th/cmp-buffer'},
	--{'hrsh7th/cmp-path'},
	--{'saadparwaiz1/cmp_luasnip'},
	--{'hrsh7th/cmp-nvim-lsp'},
	--{'hrsh7th/cmp-nvim-lua'},

	---- Snippets
	--{'L3MON4D3/LuaSnip'},
	--{'rafamadriz/friendly-snippets'},
	--}
	--}

	-- fast search anything, files, buffers, themes, etcs.
	use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } })
end)
