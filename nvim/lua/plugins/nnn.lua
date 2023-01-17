local status_ok, nnn = pcall(require, "nnn")
if not status_ok then
	return
end

nnn.setup({
	mappings = {

	},
	replace_netrw = "explorer",
	windownav = {
		left = "<C-h>",
		right = "<C-l>",
		next = "<C-k>",
		prev = "<C-j>",
	},
})
