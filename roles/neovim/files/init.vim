function! PackInit() abort
	packadd minpac

	call minpac#init()
	call minpac#add('k-takata/minpac', {'type': 'opt'})

	call minpac#add('morhetz/gruvbox')
	call minpac#add('itchyny/lightline.vim')
	call minpac#add('justinmk/vim-dirvish')
	call minpac#add('rbgrouleff/bclose.vim')
	call minpac#add('francoiscabrol/ranger.vim')
	call minpac#add('thaerkh/vim-indentguides')

	call minpac#add('konfekt/vim-alias')
	call minpac#add('editorconfig/editorconfig-vim')
	call minpac#add('tpope/vim-surround')
	call minpac#add('tpope/vim-ragtag')
	call minpac#add('tpope/vim-commentary')
	call minpac#add('mhinz/vim-grepper')
	call minpac#add('junegunn/fzf.vim')
	call minpac#add('tpope/vim-fugitive')
	call minpac#add('machakann/vim-highlightedyank')
	call minpac#add('w0rp/ale')
	call minpac#add('qpkorr/vim-renamer')

	" File types
	call minpac#add('matt-deacalion/vim-systemd-syntax')
	call minpac#add('iloginow/vim-stylus')
	call minpac#add('ledger/vim-ledger')
	call minpac#add('Glench/Vim-Jinja2-Syntax')
	call minpac#add('pangloss/vim-javascript')
	call minpac#add('kaylynb/vim-nftables', {'branch': 'noindentstyles'})
	call minpac#add('cespare/vim-toml')
	call minpac#add('pearofducks/ansible-vim')
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
"let g:gruvbox_guisp_fallback='bg'
colorscheme gruvbox
set background=dark

set tabstop=4 softtabstop=4 shiftwidth=4

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

command! -bang -nargs=? -complete=dir Files
	\ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right', '?'), <bang>0)

nnoremap <C-p> :Files<CR>
nnoremap <leader>p :Buffers<CR>

let g:grepper = {}
let g:grepper.tools = ['rg', 'git']
nnoremap <leader>* :Grepper -cword -noprompt<cr>
nnoremap <leader>g :Grepper<cr>
nnoremap <leader>G :Grepper -buffers<cr>

" let g:ranger_map_keys = 0
" let g:ranger_replace_netrw = 1
" nnoremap - :Ranger<cr>

let g:loaded_netrwPlugin = 1
command! -nargs=? -complete=dir Explore Dirvish <args>

let g:ansible_unindent_after_newline = 1
let g:ansible_name_highlight = 'd'
