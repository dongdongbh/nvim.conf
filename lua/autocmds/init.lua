-- golang build and run
local golang_group = vim.api.nvim_create_augroup("go_lang", { clear = true })

local go_build = function()
	vim.cmd([[nmap <leader>b  <Plug>(go-build)]])
end
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "go" },
	callback = go_build,
	group = golang_group,
})

local go_run = function()
	vim.cmd([[nmap <leader>r  <Plug>(go-run)]])
end
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "go" },
	callback = go_run,
	group = golang_group,
})
