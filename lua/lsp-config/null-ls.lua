local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting

-- check is format is install by :echo executable("autopep8")
local sources = {
	formatting.eslint,
	formatting.autopep8,
	formatting.stylua,
	formatting.clang_format,
}

null_ls.setup({
	sources = sources,

	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		end
	end,
})
