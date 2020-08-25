function! PackInit() abort
	packadd minpac
	
	call minpac#init()
	call minpac#add('k-takata/minpac', {'type': 'opt'})

	call minpac#add('morhetz/gruvbox')
	call minpac#add('itchyny/lightline.vim')
	call minpac#add('justinmk/vim-dirvish')
	call minpac#add('konfekt/vim-alias')
	call minpac#add('editorconfig/editorconfig-vim')
	call minpac#add('tpope/vim-surround')
	call minpac#add('tpope/vim-ragtag')
	call minpac#add('tpope/vim-commentary')
	call minpac#add('tpope/vim-fugitive')
	call minpac#add('mhinz/vim-grepper')
	call minpac#add('mattn/emmet-vim')
	{% if ansible_facts['os_family']|lower == 'windows' -%}
	call minpac#add('junegunn/fzf')
	{% endif -%}
	call minpac#add('junegunn/fzf.vim')
	call minpac#add('machakann/vim-highlightedyank')
	call minpac#add('numirias/semshi', {'do': 'UpdateRemotePlugins'})
	call minpac#add('jamessan/vim-gnupg')

	" File types
	call minpac#add('matt-deacalion/vim-systemd-syntax')
	call minpac#add('iloginow/vim-stylus')
	call minpac#add('ledger/vim-ledger')
	call minpac#add('Glench/Vim-Jinja2-Syntax')
	call minpac#add('kaylynb/vim-nftables', {'branch': 'noindentstyles'})
	call minpac#add('cespare/vim-toml')
	call minpac#add('pearofducks/ansible-vim')
	call minpac#add('yuezk/vim-js')
	call minpac#add('MaxMEllon/vim-jsx-pretty')
	call minpac#add('elzr/vim-json')

endfunction

command! PackUpdate	call PackInit() | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean	call PackInit() | call minpac#clean()
command! PackStatus	call PackInit() | call minpac#status()

" Hide buffers instead of closing
set hidden

"·Show·whitespace·chars¬
set listchars=tab:→\ ,eol:¬,space:·
set list

set termguicolors
let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark

set tabstop=2 softtabstop=2 shiftwidth=2

map <space> :

set title
set number
set noshowmode
set cursorline
set incsearch
set ignorecase
set smartcase

" preview substitute commands
set inccommand=split

" disable intro
set shortmess=IfilnxtToOF

" dirvish
let g:loaded_netrwPlugin = 1
command! -nargs=? -complete=dir Explore Dirvish <args>

" grepper
let g:grepper = {}
let g:grepper.tools = ['rg', 'git']
nnoremap <leader>* :Grepper -cword -noprompt<cr>
nnoremap <leader>g :Grepper<cr>
nnoremap <leader>G :Grepper -buffers<cr>

" fzf
{% if ansible_facts['os_family']|lower != 'windows' -%}
command! -bang -nargs=? -complete=dir Files
	\ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right', '?'), <bang>0)
{% endif -%}

nnoremap <C-p> :Files<CR>
nnoremap <leader>p :Buffers<CR>

let g:ansible_unindent_after_newline = 1
let g:ansible_name_highlight = 'd'

autocmd FileType python setlocal signcolumn=yes
