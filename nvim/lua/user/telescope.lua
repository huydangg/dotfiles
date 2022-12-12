local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

telescope.setup {
	defaults = {

		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },

		mappings = {
			i = {
			},

			n = {

			},
		},
	},
	pickers = {
		find_files = {
      theme = "dropdown",
    	find_command = { "fd", "--type", "file", "--hidden", "--glob", "--exclude", ".git" },
		},
		live_grep = {
      theme = "dropdown",
		},
		current_buffer_fuzzy_find = {
      theme = "dropdown",
			sorter = require('telescope.sorters').get_substr_matcher({}), 
		}
	},
	extensions = { },
}
