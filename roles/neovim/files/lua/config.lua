local o = vim.opt

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

-- hide buffers instead of closing
o.hidden = true

-- show whitespace chars
o.list = true
o.listchars = 'tab:→ ,eol:¬,space:·'
