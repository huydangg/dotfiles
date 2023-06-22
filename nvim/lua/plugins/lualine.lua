local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local function get_project_name()
  return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = { "TelescopePrompt", "nnn" },
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 100,
    },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { get_project_name, 'branch', 'diff', 'diagnostics' },
    lualine_c = {
      {
        'filename',
        path = 1, -- 1: Relative path
      }

    },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
