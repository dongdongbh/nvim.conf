local M = {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
}

function M.config()
	local status_ok, toggleterm = pcall(require, "toggleterm")
	if not status_ok then
		return
	end

	toggleterm.setup({
		size = function(term)
			if term.direction == "horizontal" then
				return 10 -- height for horizontal split terminals
			elseif term.direction == "vertical" then
				return math.floor(vim.o.columns * 0.4) -- width for vertical splits
			else
				return 20 -- default for floating (or any other)
			end
		end,
		open_mapping = [[<c-\>]],
		hide_numbers = true,
		shade_terminals = true,
		shading_factor = 2,
		start_in_insert = true,
		insert_mappings = true,
		persist_size = true,
		direction = "float", -- set default as horizontal split
		close_on_exit = true,
		shell = vim.o.shell,
		float_opts = {
			border = "curved",
		},
	})

	local function set_terminal_keymaps(ev)
		local opts = { buffer = ev.buf, silent = true }
		vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-W>h]], vim.tbl_extend("force", opts, { desc = "Terminal focus left" }))
		vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-W>j]], vim.tbl_extend("force", opts, { desc = "Terminal focus down" }))
		vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-W>k]], vim.tbl_extend("force", opts, { desc = "Terminal focus up" }))
		vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-W>l]], vim.tbl_extend("force", opts, { desc = "Terminal focus right" }))
	end

	vim.api.nvim_create_autocmd("TermOpen", {
		pattern = "term://*",
		callback = set_terminal_keymaps,
	})
end

return M
