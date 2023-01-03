local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end
local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end
local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end
mason.setup()
mason_lspconfig.setup()
mason_lspconfig.setup_handlers {
	function(server_name)
		local opts = {
			on_attach = require("plugins.lsp.handlers").on_attach,
			capabilities = require("plugins.lsp.handlers").capabilities,
		}
		if server_name == "gopls" then
			local gopls_opts = require("plugins.lsp.settings.gopls")
			opts = vim.tbl_deep_extend("force", gopls_opts, opts)
		end

		if server_name == "jsonls" then
			local jsonls_opts = require("plugins.lsp.settings.jsonls")
			opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
		end

		if server_name == "sumneko_lua" then
			local sumneko_opts = require("plugins.lsp.settings.sumneko_lua")
			opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
		end
		lspconfig[server_name].setup(opts)
	end,
}
