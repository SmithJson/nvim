let g:vsnip_filetypes = {}

" Javascript
let g:vsnip_filetypes.javascriptreact = ['javascript', 'typescript', 'typescriptreact']
let g:vsnip_filetypes.typescriptreact = ['javascript', 'typescript', 'javascriptreact']
let g:vsnip_filetypes.javascript = ['typescript']
let g:vsnip_filetypes.typescript = ['javascript']
" let g:vsnip_filetypes.javascript = ['typescript', 'javascriptreact', 'typescriptreact']
" let g:vsnip_filetypes.typescript = ['javascript', 'javascriptreact', 'typescriptreact']

" Css
let g:vsnip_filetypes.less = ['css']
let g:vsnip_filetypes.sass = ['css']
let g:vsnip_filetypes.scss = ['css']

" Vue
let g:vsnip_filetypes.vue = ['vue', 'javascript']

imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
