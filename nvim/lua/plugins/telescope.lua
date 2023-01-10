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
			find_command = { "rd", "--color=never", "--with-filename", "--line-number", "--column", "---smart-case" },
		},
		current_buffer_fuzzy_find = {
			theme = "dropdown",
		}
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		}
	},
}
