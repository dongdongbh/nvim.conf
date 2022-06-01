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
	use("wbthomason/packer.nvim")

	-- ui related -----------------------------------------------------------
	--theme
	use("morhetz/gruvbox")
	--support icons
	use("kyazdani42/nvim-web-devicons")
	-- fast search anything, files, buffers, themes, etcs.
	use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } })
	-- adds indentation guides to all lines
	use("lukas-reineke/indent-blankline.nvim")
	-- tab bar
	use("romgrk/barbar.nvim")
	-- statusline
	use("nvim-lualine/lualine.nvim")
	-- support vifm file manager
	use("vifm/vifm.vim")
	-- file explore
	use("kyazdani42/nvim-tree.lua")
	-- nice looking notify
	use("rcarriga/nvim-notify")
	-- startup menu
	use("mhinz/vim-startify")
	-- shortcut work with tmux
	use("christoomey/vim-tmux-navigator")
	-- float terminal
	use("voldikss/vim-floaterm")

	-- editing related -----------------------------------------------------------
	-- All the lua functions I don't want to write twice
	use("nvim-lua/plenary.nvim")
	-- auto pair
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	})

	-- make plugin command repeatable
	use("tpope/vim-repeat")
	-- comment
	use("preservim/nerdcommenter")
	-- surround
	use("tpope/vim-surround")
	-- search with three letters
	use("justinmk/vim-sneak")
	-- abolish hard to explain
	use("tpope/vim-abolish")
	--formatting
	use({ "jose-elias-alvarez/null-ls.nvim" })
	-- grammar check
	use("rhysd/vim-grammarous")
	--highlights
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	-- language related tools -----------------------------------------------------------
	use("fatih/vim-go")

	-- git tools -----------------------------------------------------------
	use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

	-- other tools -----------------------------------------------------------
	-- wakatime work time monitor
	use("wakatime/vim-wakatime")
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

	---- Autocomplete -------------------------------------------------------
	---- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	-- buffer completions
	use("hrsh7th/cmp-buffer")
	-- path completions
	use("hrsh7th/cmp-path")
	-- cmdline completions
	use("hrsh7th/cmp-cmdline")
	-- snippet completions
	use("saadparwaiz1/cmp_luasnip")
	-- cmo for nvim lua configs
	use("hrsh7th/cmp-nvim-lua")
	-- support completion from lsp
	use("hrsh7th/cmp-nvim-lsp")

	---- snippets

	--snippet engine
	use("L3MON4D3/LuaSnip")
	-- a bunch of snippets to use
	use("rafamadriz/friendly-snippets")

	-- markdown preview
	-- install without yarn or npm
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})
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
end)
