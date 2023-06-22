require "options"
require "utils"
require "pluginList"
require "keymaps"
require "theme"

--
require "plugins.cmp"
require "plugins.lsp"
require "plugins.fzf"
require "plugins.treesitter"
require "plugins.autopairs"
require "plugins.comment"
require "plugins.lualine"
require "plugins.indent-blankline"

require("oil").setup()
require('leap').add_default_mappings()
