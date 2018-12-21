function! PackInit() abort
	packadd minpac

	call minpac#init()
	call minpac#add('k-takata/minpac', {'type': 'opt'})

	call minpac#add('morhetz/gruvbox')
	call minpac#add('justinmk/vim-dirvish')
	call minpac#add('itchyny/lightline.vim')
	call minpac#add('editorconfig/editorconfig-vim')
	call minpac#add('tpope/vim-surround')
	call minpac#add('iloginow/vim-stylus')
	call minpac#add('scrooloose/nerdtree')
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

set number
set noshowmode
set cursorline
set incsearch
set smartcase

let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_keepdir=0

let g:NERDTreeHijackNetrw=0
let g:NERDTreeMinimalUI=1

nnoremap <C-p> :<C-u>FZF<CR>
