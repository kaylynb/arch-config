require('telescope').setup {
	defaults = {
		mappings = {
			i = {
				["<esc>"] = require('telescope.actions').close
			}
		}
	}
}

telescope_binds = {
	{ '<C-p>', 'find_files' },
	{ '<leader>f', 'live_grep' },
	{ '<leader>F', 'grep_string' },
	{ '<leader>h', 'help_tags'},
	{ '<leader>b', 'buffers' },
	{ '<leader>B', 'live_grep', 'grep_open_files = true'},
}

for _,bind in pairs(telescope_binds) do
	local lhs = bind[1]
	local cmd = bind[2]
	local opts = bind[3]
	local rhs =
		[[<cmd> lua require('telescope.builtin').]] ..
		cmd ..
		[[(require('telescope.themes').get_ivy({]] ..
		(opts or '') ..
		[[}))<cr>]]

	vim.api.nvim_set_keymap('n', lhs, rhs, {noremap = true})
end
