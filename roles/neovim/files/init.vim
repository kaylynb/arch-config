function! PackInit() abort
	packadd minpac

	call minpac#init()
	call minpac#add('k-takata/minpac', {'type': 'opt'})

	call minpac#add('morhetz/gruvbox')
	call minpac#add('itchyny/lightline.vim')
	call minpac#add('justinmk/vim-dirvish')
	call minpac#add('scrooloose/nerdtree')

	call minpac#add('konfekt/vim-alias')
	call minpac#add('editorconfig/editorconfig-vim')
	call minpac#add('tpope/vim-surround')
	call minpac#add('mhinz/vim-grepper')
	call minpac#add('junegunn/fzf.vim')
	call minpac#add('tpope/vim-fugitive')
	call minpac#add('w0rp/ale')

	" File types
	call minpac#add('matt-deacalion/vim-systemd-syntax')
	call minpac#add('iloginow/vim-stylus')
	call minpac#add('ledger/vim-ledger')
	call minpac#add('Glench/Vim-Jinja2-Syntax')
endfunction

command! PackUpdate	call PackInit() | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean	call PackInit() | call minpac#clean()
command! PackStatus	call PackInit() | call minpac#status()

"·Show·whitespace·chars¬
set hidden
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

let g:NERDTreeMinimalUI=1

command! -bang -nargs=? -complete=dir Files
	\ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right', '?'), <bang>0)

nnoremap <C-p> :<C-u>Files<CR>

let g:grepper = {}
let g:grepper.tools = ['rg', 'git']
nnoremap <leader>* :Grepper -cword -noprompt<cr>
nnoremap <leader>g :Grepper<cr>
nnoremap <leader>G :Grepper -buffers<cr>
