let g:floaterm_position = 'center'
let g:floaterm_wintype = 'floating'

" Set floaterm window's background to black
hi Floaterm guibg=black
" Set floating window border line color to cyan, and background to orange
hi FloatermBorder guibg=none guifg=cyan

noremap <LEADER>ftn :FloatermNew<CR>
noremap <LEADER>ftk :FloatermKill<CR>

