local g = vim.g
local disabled_built_ins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
  g["loaded_" .. plugin] = 1
end

g.mapleader = " "
g.maplocalleader = " "
g.loaded_netrwPlugin = 1
g.loaded_netrw = 1
g.gitblame_enabled = 0
g.gitblame_date_format = '%r'

-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   pattern = "fzf",
--   command = ":set modifiable",
-- })
