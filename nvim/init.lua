require "user.plugins"
require "user.options"
require "user.keymaps"
require "user.colorscheme"
require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.treesitter"
require "user.gitsigns"
require "user.autopairs"
require "user.comment"
require "user.nvim-tree"
require "user.lualine"
require "user.alpha"
require "user.project"
require "user.impatient"
require "user.auto-session"
require "user.indent-blankline"


local c = require('vscode.colors')
require('vscode').setup({
    -- Enable transparent background
    transparent = true,

    -- Enable italic comment
    italic_comments = true,

    -- Disable nvim-tree background color
    disable_nvimtree_bg = true,

    -- Override colors (see ./lua/vscode/colors.lua)
    color_overrides = {
        vscLineNumber = '#0a7aad',
    },

    -- Override highlight groups (see ./lua/vscode/theme.lua)
    group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        Cursor = { fg=c.vscDarkBlue, bg=c.vscYellowOrange, bold=true },
    }
})
