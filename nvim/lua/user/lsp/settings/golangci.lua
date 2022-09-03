local lspconfig = require 'lspconfig'

return {
	cmd = { 'golangci-lint-langserver' },
	root_dir = lspconfig.util.root_pattern('.git', 'go.mod'),
	init_options = {
		command = { "golangci-lint", "run", "--enable-all", "--disable", "lll", "--out-format", "json" };
	}
}
