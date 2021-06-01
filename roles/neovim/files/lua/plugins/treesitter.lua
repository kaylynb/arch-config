require('nvim-treesitter.configs').setup {
	ensure_installed = {
		'bash',
		'c',
		'comment',
		'cpp',
		'css',
		-- 'dockerfile',
		-- 'elixir',
		-- 'erlang',
		'html',
		'javascript',
		'json',
		'jsonc',
		'lua',
		'python',
		'regex',
		'toml',
		'yaml',
	},
	highlight = {
		enable = true,
	},
}

vim.cmd [[
autocmd FileType jinja.html TSBufDisable highlight
]]
