local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion

-- check is format is install by :echo executable("autopep8")
local sources = {
	formatting.black.with({ extra_args = { "--fast" } }),
	formatting.stylua,
	formatting.clang_format,
	diagnostics.flake8,
	completion.spell,
}

null_ls.setup({
	sources = sources,

	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		end
	end,
})
