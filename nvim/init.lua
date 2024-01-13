require "options"
require "utils"
require "pluginList"
require "keymaps"
require "theme"

--
require "plugins.cmp"
require "plugins.lsp"
-- require "plugins.fzf"
require "plugins.telescope"
require "plugins.treesitter"
require "plugins.autopairs"
require "plugins.comment"
require "plugins.lualine"
require "plugins.indent-blankline"
require "plugins.rust-tools"
require "plugins.dapui"
require "plugins.spectre"

require("oil").setup()
require('leap').add_default_mappings()
