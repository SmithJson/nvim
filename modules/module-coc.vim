
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'
let g:coc_status_error_sign = '•'
let g:coc_status_warning_sign = '•'
let g:coc_disable_transparent_cursor = 1

let g:coc_global_extensions =[
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-vimlsp',
    \ 'coc-snippets',
		\ 'coc-translator',
    \ 'coc-emmet',
    \ 'coc-json',
    \ 'coc-highlight',
    \ 'coc-git',
    \ 'coc-emoji',
    \ 'coc-lists',
    \ 'coc-yaml',
    \ 'coc-tabnine',
    \ 'coc-gitignore',
    \ 'coc-pairs',
    \ 'coc-yank',
    \ 'coc-actions',
    \ 'coc-db',
    \ 'coc-spell-checker',
    \ 'coc-wxml',
    \ 'coc-imselect'
    \]

augroup MyAutoCmd
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

"Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"解决coc.nvim大文件卡死状况
let g:trigger_size = 0.5 * 1048576

augroup hugefile
  autocmd!
  autocmd BufReadPre *
        \ let size = getfsize(expand('<afile>')) |
        \ if (size > g:trigger_size) || (size == -2) |
        \   echohl WarningMsg | echomsg 'WARNING: altering options for this huge file!' | echohl None |
        \   exec 'CocDisable' |
        \ else |
        \   exec 'CocEnable' |
        \ endif |
        \ unlet size
augroup END
