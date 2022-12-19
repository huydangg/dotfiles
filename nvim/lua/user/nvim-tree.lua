local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

nvim_tree.setup {
	auto_reload_on_write = true,
  open_on_setup_file = true,
  disable_netrw = false,
  sort_by = "name",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
	filters = {
		dotfiles = true,
		custom = {},
		exclude = { ".gitignore", ".env*" , ".zshrc", ".tmux.conf", ".*.yml"},
	},
}
