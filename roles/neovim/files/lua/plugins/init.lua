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

-- deps
--paq 'nvim-lua/popup.nvim'
--paq 'nvim-lua/plenary.nvim'

paq 'itchyny/lightline.vim'
paq 'jamessan/vim-gnupg'
paq 'justinmk/vim-dirvish'
paq 'machakann/vim-highlightedyank'
paq 'mattn/emmet-vim'
paq 'mhinz/vim-grepper'
paq 'morhetz/gruvbox'
--paq 'nvim-telescope/telescope.nvim'
paq 'tpope/vim-commentary'
paq 'tpope/vim-fugitive'
paq 'tpope/vim-ragtag'
paq 'tpope/vim-surround'
-- paq {'nvim-treesitter/nvim-treesitter', run = function() vim.api.nvim_command('TSUpdate') end}

-- file types
paq 'Glench/Vim-Jinja2-Syntax'
paq 'editorconfig/editorconfig-vim'
paq 'elzr/vim-json'
paq 'iloginow/vim-stylus'
paq 'ledger/vim-ledger'
paq 'matt-deacalion/vim-systemd-syntax'
paq 'pearofducks/ansible-vim'
paq 'yuezk/vim-js'
paq 'ziglang/zig.vim'
paq {'kaylynb/vim-nftables', branch = 'noindentstyles'}

-- use fzf until telescope is fixed
if vim.fn.has('win64') == 1 then
	paq 'junegunn/fzf'
end
paq 'junegunn/fzf.vim'

vim.cmd [[
	let g:fzf_layout = { 'down': '40%' }
	nnoremap <C-p> :Files<CR>
	nnoremap <leader>b :Buffers<CR>
]]

require('plugins.ansible')
require('plugins.dirvish')
require('plugins.grepper')
--require('plugins.telescope')
-- require('plugins.treesitter')
