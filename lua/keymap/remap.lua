local map = require('core.keymap')
local cmd = map.cmd

map.n({
    ['s'] = cmd('<nop>'),
    ['S'] = cmd('<nop>'),
    ['<C-w>'] = cmd('bdelete'),
    ['sj'] = cmd(':set nosplitbelow<CR>:split<CR>:set splitbelow<CR>'),
    ['sk'] = cmd(':set splitbelow<CR>:split<CR>'),
    ['sh'] = cmd(':set nosplitright<CR>:vsplit<CR>:set splitright<CR>'),
    ['sl'] = cmd(':set splitright<CR>:vsplit<CR>'),
    ['srv'] = '<C-w>b<C-w>H',
    ['<LEADER><CR>'] = cmd('nohlsearch'),
    ['<left>'] = cmd('vertical resize -5'),
    ['<right>'] = cmd('vertical resize +5'),
    ['<up>'] = cmd('res +5'),
    ['<down>'] = cmd('res -5'),
})

map.v({
    ['Y'] = cmd('"+y')
})

map.i({
    ['<C-a>'] = '<Home>',
    ['<C-e>'] = '<End>',
    ['<C-f>'] = '<Right>',
    ['<C-b>'] = '<Left>',
    ['<C-n>'] = '<Down>',
    ['<C-p>'] = '<Up>',
    ['<C-j>'] = '<Esc>o',
    ['<C-k>'] = '<Esc>O'
})

map.c({
    ['<C-b>'] = '<Left>',
    ['<C-f>'] = '<Right>',
    ['<C-a>'] = '<Home>',
    ['<C-e>'] = '<End>',
    ['<C-d>'] = '<Del>',
    ['<C-h>'] = '<BS>',
})
