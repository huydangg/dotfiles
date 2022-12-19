local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap
-- Normal
-- Remap space as leader key
keymap("n", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)


-- Nvim tree
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)

-- Insert
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)


--Visual
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Telescope
-- TODO: MOVE this function to telescope.lua
local tb = require('telescope.builtin')
local function get_visual_selection()
	local s_start = vim.fn.getpos("'<")
	local s_end = vim.fn.getpos("'>")
	local n_lines = math.abs(s_end[2] - s_start[2]) + 1
	local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
	lines[1] = string.sub(lines[1], s_start[3], -1)
	if n_lines == 1 then
		lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
	else
		lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
	end
	return table.concat(lines, '\n')
end

function visual_live_grep()
	local text = get_visual_selection()
	tb.live_grep({ default_text = text })
end

function visual_current_buffer_fuzzy_find()
	local text = get_visual_selection()
	tb.current_buffer_fuzzy_find({ default_text = text })
end

keymap("n", "<C-p>", ":Telescope find_files no_ignore=true<CR>", opts)
keymap("n", "<C-g>", ":Telescope live_grep<CR>", opts)
keymap("v", "<C-g>", ":lua visual_live_grep()<CR>", opts)
keymap("n", "<C-Space>", ":Telescope current_buffer_fuzzy_find<CR>", opts)
keymap("v", "<C-Space>", ":lua visual_current_buffer_fuzzy_find()<CR>", opts)

--Gitsigns
keymap("n", "<leader>b", ":Gitsigns blame_line<CR>", opts)

