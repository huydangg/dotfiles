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

local tb = require('telescope.builtin')
local function get_visual_selection()
	local s_start = vim.fn.getpos("'<")
	local s_end = vim.fn.getpos("'>")
	local n_lines = math.abs(s_end[2] - s_start[2]) + 1
	local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
	lines[1] = string.sub(lines[1], s_start[3], -1)
	if n_lines == 1 then
		lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
	else
		lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
	end
	return table.concat(lines, '\n')
end

function VISUAL_LIVE_GREP()
	local text = get_visual_selection()
	tb.live_grep({ default_text = text })
end

function VISUAL_CURRENT_BUFFER_FUZZY_FIND()
	local text = get_visual_selection()
	tb.current_buffer_fuzzy_find({ default_text = text })
end
