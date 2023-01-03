local status_ok, nnn = pcall(require, "nnn")
if not status_ok then
	return
end
-- local status_ok, builtin = pcall(require, "nnn.builtin")
-- if not status_ok then
-- 	return
-- end
nnn.setup({
	mappings = {
		-- { "<C-t>", builtin.open_in_tab }, -- open file(s) in tab
		-- { "<C-s>", builtin.open_in_split }, -- open file(s) in split
		-- { "<C-v>", builtin.open_in_vsplit }, -- open file(s) in vertical split
		-- { "<C-p>", builtin.open_in_preview }, -- open file in preview split keeping nnn focused
		-- { "<C-y>", builtin.copy_to_clipboard }, -- copy file(s) to clipboard
		-- { "<C-w>", builtin.cd_to_path }, -- cd to file directory
		-- { "<C-e>", builtin.populate_cmdline }, -- populate cmdline (:) with file(s)
	},
	replace_netrw = "explorer",
	windownav = { -- window movement mappings to navigate out of nnn
		left = "<C-h>",
		right = "<C-l>",
		next = "<C-k>",
		prev = "<C-j>",
	},
})
