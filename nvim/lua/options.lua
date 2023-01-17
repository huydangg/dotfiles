-- :help options
local opt = vim.opt

opt.background = "light"

opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
opt.mouse = "a" -- allow the mouse to be used in neovim
opt.ignorecase = true -- ignore case in search patterns
opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
opt.tabstop = 2 -- insert 2 spaces for a tab
opt.termguicolors = true
opt.title = true

-- Numbers
opt.number = false
opt.cursorline = true

opt.numberwidth = 2
opt.ruler = false

opt.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
	command = "if mode() != 'c' | checktime | endif",
	pattern = { "*" },
})

opt.lazyredraw = true
opt.shada = ""
