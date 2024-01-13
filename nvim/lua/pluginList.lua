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
  "nvim-lua/plenary.nvim",
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    -- or                              , branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    }
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

  -- cmp plugins
  {
    "hrsh7th/nvim-cmp", -- The completion plugin
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-buffer",  -- buffer completions
      "hrsh7th/cmp-path",    -- path completions
      "hrsh7th/cmp-cmdline", -- cmdline completions
      "hrsh7th/cmp-nvim-lsp",
    },
  },


  -- LSP
  {
    "neovim/nvim-lspconfig", -- enable LSP
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },

  {
    "simrat39/rust-tools.nvim",
    "mfussenegger/nvim-dap",
    { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    cmd = "TSUpdate"
  },


  -- Autopairs
  "windwp/nvim-autopairs",

  -- Comment
  "numToStr/Comment.nvim",

  "lukas-reineke/indent-blankline.nvim",

  "ggandor/leap.nvim",


  "stevearc/oil.nvim",




  "Mofiqul/vscode.nvim",
  "nvim-pack/nvim-spectre",
  "tpope/vim-fugitive",
})
