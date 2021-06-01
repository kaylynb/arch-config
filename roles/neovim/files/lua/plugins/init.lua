local paq_install_path = vim.fn.stdpath('data') ..
	'/site/pack/paqs/opt/paq-nvim'

if vim.fn.empty(vim.fn.glob(paq_install_path)) > 0 then
	vim.api.nvim_command(
		'!git clone https://github.com/savq/paq-nvim.git ' .. paq_install_path
	)

	print('installed paq-nvim, restart and run :PaqInstall')
end

vim.api.nvim_command [[packadd paq-nvim]]
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

require('plugins.telescope')
require('plugins.dirvish')
require('plugins.grepper')
require('plugins.ansible')
