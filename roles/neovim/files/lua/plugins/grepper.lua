local k = vim.api.nvim_set_keymap

vim.g.grepper = {tools = {'rg', 'git'}}
k('n', '<leader>*', ':Grepper -cword -noprompt<cr>', {noremap = true})
k('n', '<leader>g', ':Grepper<cr>', {noremap = true})
k('n', '<leader>G', ':Grepper -buffers<cr>', {noremap = true})
