local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local codeAction = null_ls.builtins.code_actions
null_ls.setup({
	sources = {
		formatting.stylua,
		formatting.prettier,
		diagnostics.eslint,
		codeAction.eslint,
	},
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
		end
	end,
})
