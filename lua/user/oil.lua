local M = {
	"stevearc/oil.nvim",
	lazy = false, -- not lazy loaded because it needs to work in all situations
	opts = {},
	dependencies = {
		{ "echasnovski/mini.icons", opts = {} },
		-- You can also use: { "nvim-tree/nvim-web-devicons" },
	},
}

function M.config()
	require("oil").setup(M.opts)
end

return M
