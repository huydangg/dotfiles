local fn = vim.fn
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	return
end



return lazy.setup({
	--ColorScheme
	"Mofiqul/vscode.nvim",

	"nvim-lua/plenary.nvim",

	-- Try to off nvim-tree for while
	-- {
	-- 	"nvim-tree/nvim-tree.lua",
	-- 	dependencies = {
	-- 		"nvim-tree/nvim-web-devicons", -- optional, for file icon
	-- 	},
	-- },


	{
		"nvim-lualine/lualine.nvim",
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},

	-- cmp plugins
	{
		"hrsh7th/nvim-cmp", -- The completion plugin
		-- event = "InsertEnter",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-buffer", -- buffer completions
			"hrsh7th/cmp-path", -- path completions
			"hrsh7th/cmp-cmdline", -- cmdline completions
			"hrsh7th/cmp-nvim-lsp",
		},
	},


	-- LSP
	"neovim/nvim-lspconfig", -- enable LSP
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
	},


	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		cmd = "TSUpdate"
	},

	-- Gitsigns
	"lewis6991/gitsigns.nvim",

	-- Autopairs
	"windwp/nvim-autopairs",

	-- Comment
	"numToStr/Comment.nvim",

	-- "rmagatti/auto-session",

	"lukas-reineke/indent-blankline.nvim",

	"ggandor/lightspeed.nvim",

	"luukvbaal/nnn.nvim"
})