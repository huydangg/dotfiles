local c = require('vscode.colors')
local vscode = require('vscode')

vscode.setup({
	-- -- Enable transparent background
	transparent = false,
	--
	-- -- Enable italic comment
	italic_comments = true,
	--
	-- -- Disable nvim-tree background color
	disable_nvimtree_bg = true,
	--
	-- -- Override colors (see ./lua/vscode/colors.lua)
	color_overrides = {
		vscLineNumber = '#0a7aad',
	},
	--
	-- -- Override highlight groups (see ./lua/vscode/theme.lua)
	group_overrides = {
		-- this supports the same val table as vim.api.nvim_set_hl
		-- use colors from this colorscheme by requiring vscode.colors!
		-- Cursor = { fg = c.vscBlack, bg = c.vscBlack, bold = true },
		["@keyword"] = { fg = c.vscBlue, bg = c.vscNone },
		["@include"] = { fg = c.vscBlue, bg = c.vscNone },
		["@keyword.return"] = { fg = c.vscPink, bg = c.vscNone }
	}
})
