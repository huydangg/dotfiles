local status_ok, fzf = pcall(require, "fzf-lua")
if not status_ok then
  return
end
--line-number
fzf.setup {
  -- winopts = {
  --   on_create = function()
  --     vim.keymap.set("t", "jk",
  --       "<cmd>lua vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-\\><C-n>', true, false, true), 'n', true)<CR>",
  --       { nowait = true, noremap = true, buffer = vim.api.nvim_get_current_buf() })
  --     vim.keymap.set("n", "q", function()
  --       vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("i", true, false, true) or "", "n", true)
  --       vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true) or "", "n", true)
  --     end, { nowait = true, noremap = true, buffer = vim.api.nvim_get_current_buf() })
  --     vim.keymap.set("n", "j", function()
  --       vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("i", true, false, true) or "", "n", true)
  --       vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-j>", true, false, true) or "", "n", true)
  --       vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true) or "", "n", true)
  --     end, { nowait = true, noremap = true, buffer = vim.api.nvim_get_current_buf() })
  --     vim.keymap.set("n", "k", function()
  --       vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("i", true, false, true) or "", "n", true)
  --       vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-k>", true, false, true) or "", "n", true)
  --       vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true) or "", "n", true)
  --     end, { nowait = true, noremap = true, buffer = vim.api.nvim_get_current_buf() })
  --     vim.keymap.set("n", "<CR>", function()
  --       vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("i", true, false, true) or "", "n", true)
  --       vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>", true, false, true) or "", "n", true)
  --     end, { nowait = true, noremap = true, buffer = vim.api.nvim_get_current_buf() })
  --   end
  -- },
  keymap = {
    fzf = {
      ["ctrl-q"] = "select-all+accept",
    }
  },
  files = {
    cmd =
    "fd --type file --hidden -I --glob --exclude .git --exclude .cache --exclude *.o --exclude vendor --exclude node_modules --exclude target",
    multiprocess = true
  },
  grep = {
    cmd =
    "rg --color=never --with-filename --line-number --column ---smart-case -g '!{**/.git/*,**/node_modules/*,**/vendor/*}'",
    multiprocess = true
  },
  live_grep = {
    cmd =
    "rg --color=never --with-filename --line-number --column ---smart-case -g '!{**/.git/*,**/node_modules/*,**/vendor/*}'",
    multiprocess = true
  },
}

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
  fzf.live_grep({ search = text })
end

function VISUAL_CURRENT_BUFFER_FUZZY_FIND()
  local text = get_visual_selection()
  fzf.lgrep_curbuf({ search = text })
end
