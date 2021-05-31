local o = vim.opt
local c = vim.api.nvim_command
local k = vim.api.nvim_set_keymap

-- plugins
c [[packadd paq-nvim]]
local paq = require 'paq-nvim'.paq

paq {'savq/paq-nvim', opt = true}

paq 'morhetz/gruvbox'
paq 'itchyny/lightline.vim'
paq 'justinmk/vim-dirvish'
paq 'tpope/vim-surround'
paq 'tpope/vim-ragtag'
paq 'tpope/vim-commentary'
paq 'tpope/vim-fugitive'
paq 'mhinz/vim-grepper'
paq 'mattn/emmet-vim'
paq 'machakann/vim-highlightedyank'
paq 'jamessan/vim-gnupg'

-- telescope
paq 'nvim-lua/popup.nvim'
paq 'nvim-lua/plenary.nvim'
paq 'nvim-telescope/telescope.nvim'

-- file types
paq 'editorconfig/editorconfig-vim'
paq 'matt-deacalion/vim-systemd-syntax'
paq 'iloginow/vim-stylus'
paq 'ledger/vim-ledger'
paq 'Glench/Vim-Jinja2-Syntax'
paq {'kaylynb/vim-nftables', branch = 'noindentstyles'}
paq 'cespare/vim-toml'
paq 'pearofducks/ansible-vim'
paq 'yuezk/vim-js'
paq 'elzr/vim-json'

-- update title based on buffer
o.title = true

-- show line numbers
o.number = true

-- highlight line
o.cursorline = true

-- search options
o.incsearch = true
o.ignorecase = true
o.smartcase = true

-- preview substitute commands
o.inccommand = 'split'

-- disable intro
o.shortmess = vim.opt.shortmess + 'I'

-- disable showmode (lightline shows this)
o.showmode = false

-- tabstops
local tabstop = 2
o.tabstop = tabstop
o.softtabstop = tabstop
o.shiftwidth = tabstop

-- colorscheme
o.termguicolors = true
vim.g.gruvbox_italic = 1
o.background = 'dark'
vim.cmd('colorscheme gruvbox')

-- hide buffers instead of closing
o.hidden = true

-- show whitespace chars
o.list = true
o.listchars = 'tab:→ ,eol:¬,space:·'

-- alias for command-line mode
k('', '<space>', ':', {})

-- move lines
k('n', '<A-j>', ':m .+1<CR>==', {noremap = true})
k('n', '<A-k>', ':m .-2<CR>==', {noremap = true})
k('v', '<A-j>', ":m '>+1<CR>gv=gv", {noremap = true})
k('v', '<A-k>', ":m '<-2<CR>gv=gv", {noremap = true})

-- dirvish
vim.g.loaded_netrwPlugin = 1
c [[command! -nargs=? -complete=dir Explore Dirvish <args>]]

-- grepper
vim.g.grepper = {tools = {'rg', 'git'}}
k('n', '<leader>*', ':Grepper -cword -noprompt<cr>', {noremap = true})
k('n', '<leader>g', ':Grepper<cr>', {noremap = true})
k('n', '<leader>G', ':Grepper -buffers<cr>', {noremap = true})

-- ansible
vim.g.ansible_unindent_after_newline = 1
vim.g.ansible_name_highlight = 'd'

-- telescope
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

	k('n', lhs, rhs, {noremap = true})
end
