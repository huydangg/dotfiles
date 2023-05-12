-- :help options
local opt = vim.opt

opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
opt.mouse = "a"               -- allow the mouse to be used in neovim
opt.ignorecase = true         -- ignore case in search patterns
opt.termguicolors = true
opt.title = true


-- Ident
opt.expandtab = true
opt.smartindent = true
opt.tabstop = 2
opt.shiftwidth = 2

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
