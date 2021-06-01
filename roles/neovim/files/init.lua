local k = vim.api.nvim_set_keymap

require('config')

-- alias for command-line mode
k('', '<space>', ':', {})

-- move lines
k('n', '<A-j>', ':m .+1<CR>==', {noremap = true})
k('n', '<A-k>', ':m .-2<CR>==', {noremap = true})
k('v', '<A-j>', ":m '>+1<CR>gv=gv", {noremap = true})
k('v', '<A-k>', ":m '<-2<CR>gv=gv", {noremap = true})

vim.cmd [[
" autocmd FileType python setlocal signcolumn=yes
autocmd FileType c,cpp setlocal commentstring=//\ %s
]]

require('plugins')
require('colorscheme')
