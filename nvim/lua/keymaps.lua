local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap
-- Normal
-- Remap space as leader key
keymap("n", "<Space>", "<Nop>", opts)


-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)


-- nnn
keymap("n", "<C-n>", ":Oil<CR>", opts)

-- Insert
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("c", "jk", "<ESC>", opts)


--Visual
-- Stay in indent mode
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

keymap("v", "p", '"_dP', opts)

-- Fzf
keymap("n", "<C-p>", ":FzfLua files<CR>", opts)
keymap("n", "<leader>g", ":lua require'fzf-lua'.live_grep()<CR>", opts)
keymap("v", "<leader>g", ":lua VISUAL_LIVE_GREP()<CR>", opts)
keymap("n", "<leader>f", ":lua require'fzf-lua'.lgrep_curbuf()<CR>", opts)
keymap("v", "<leader>f", ":lua VISUAL_CURRENT_BUFFER_FUZZY_FIND()<CR>", opts)

-- Gitsigns
keymap("n", "<leader>b", ":GitBlameToggle<CR>", opts)

-- diagnostic
keymap("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
keymap("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
keymap("n", "gl", '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
