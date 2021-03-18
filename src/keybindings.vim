
function! s:load_default() abort
  " Window management
  noremap <LEADER>w <C-w>w
  noremap <LEADER>k <C-w>k
  noremap <LEADER>j <C-w>j
  noremap <LEADER>h <C-w>h
  noremap <LEADER>l <C-w>l

  " Disable the default s key
  noremap s <nop>

  " split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
  noremap sj :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
  noremap sk :set splitbelow<CR>:split<CR>
  noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
  noremap sl :set splitright<CR>:vsplit<CR>

  " Resize splits with arrow keys
  noremap <up> :res +5<CR>
  noremap <down> :res -5<CR>
  noremap <left> :vertical resize-5<CR>
  noremap <right> :vertical resize+5<CR>

  " Place the two screens up and down
  noremap sh <C-w>t<C-w>K
  " Place the two screens side by side
  noremap sv <C-w>t<C-w>H

  " Rotate screens
  noremap srh <C-w>b<C-w>K
  noremap srv <C-w>b<C-w>H

  " Save & quit
  noremap S :w<CR>
  noremap Q :q<CR>

  " Emacs keymap (insert mode cursor move)
  inoremap <C-a> <Home>
  inoremap <C-e> <End>
  inoremap <C-f> <Right>
  inoremap <C-b> <Left>
  inoremap <C-n> <Down>
  inoremap <C-p> <Up>

  " noremap 1 0
  " noremap 0 $

  " Open init.vim
  noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>

  " Copy to system clipboard
  vnoremap Y "+y

  " Indentation
  noremap < <<
  noremap > >>

  " Search
  noremap <LEADER><CR> :nohlsearch<CR>

  " Other
  noremap <LEADER>/ :set splitbelow<CR>:res +10<CR>:term<CR>

  " Call figlet
  noremap tx :r !figlet

  " Press space twice to jump to the next '<++>' and edit it
  inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
  " Unotree
  noremap L :UndotreeToggle<CR>

endfunction

function! s:load_dashboard() abort
  if utils#tap('dashboard-nvim')
    nnoremap <silent> <Leader>os  :<C-u>Dashboard<CR>
  endif
endfunction

function! s:load_accelerated_jk() abort
  if utils#tap('accelerated-jk')
    nmap j <Plug>(accelerated_jk_gj)
    nmap k <Plug>(accelerated_jk_gk)
  endif
endfunction

function! s:load_coc_clap() abort
  if utils#tap('coc-clap')
    " Show all diagnostics
    nnoremap <silent> <Leader>ce  :Clap coc_diagnostics<CR>
    " Manage extensions
    nnoremap <silent> <Leader>;   :Clap coc_extensions<CR>
    " Show commands
    nnoremap <silent> <Leader>,   :Clap coc_commands<CR>
    " Search workspace symbols
    nnoremap <silent> <Leader>cs  :Clap coc_symbols<CR>
    nnoremap <silent> <Leader>cS  :Clap coc_services<CR>
    nnoremap <silent> <leader>ct  :Clap coc_outline<CR>
  endif
endfunction

function! s:load_coc() abort
  if utils#tap('coc.nvim')
    " Remap for do codeAction of selected region
    function! s:cocActionsOpenFromSelected(type) abort
      execute 'CocCommand actions.open ' . a:type
    endfunction
    " Jump definition in other window
    function! s:definition_other_window() abort
      if winnr('$') >= 4 || winwidth(0) < 120
        exec "normal \<Plug>(coc-definition)"
      else
        exec 'vsplit'
        exec "normal \<Plug>(coc-definition)"
      endif
    endfunction
    xmap <silent> <Leader>ca :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
    nmap <silent> <Leader>ca :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
    " Do default action for next item.
    nmap <silent> [a  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nmap <silent> ]a  :<C-u>CocPrev<CR>
    " Resume latest coc list
    nnoremap <silent> <Leader>'  :<C-u>CocListResume<CR>
    " Use `[e` and `]e` for navigate diagnostics
    nmap <silent> ]e <Plug>(coc-diagnostic-prev)
    nmap <silent> [e <Plug>(coc-diagnostic-next)
    " Remap for rename current word
    nmap <Leader>cn <Plug>(coc-rename)
    " Remap for format selected region
    vmap <Leader>cf  <Plug>(coc-format-selected)
    nmap <Leader>cf  <Plug>(coc-format-selected)
    " Fix autofix problem of current line
    nmap <Leader>cF  <Plug>(coc-fix-current)
    " Remap keys for gotos
    nmap <silent> gd :<C-u>call <sid>definition_other_window()<CR>
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> <Leader>ci <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    " Use K for show documentation in float window
    nnoremap <silent> K :call CocActionAsync('doHover')<CR>
    nnoremap <silent> <Leader>cd :call CocActionAsync('doHover')<CR>
    " use <c-space> for trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()
    nmap ]g <Plug>(coc-git-prevchunk)
    nmap [g <Plug>(coc-git-nextchunk)
    " show chunk diff at current position
    nmap <Leader>gi <Plug>(coc-git-chunkinfo)
    " show commit contains current position
    nmap <Leader>gm <Plug>(coc-git-commit)
    " float window scroll
    nnoremap <expr><C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
    nnoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"
    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR  :call CocAction('runCommand', 'editor.action.organizeImport')
    nnoremap <silent> <Leader>co :<C-u>OR<CR>
    " multiple cursors
    nmap <silent><M-s> <Plug>(coc-cursors-position)
    nmap <expr> <silent><M-d> <SID>select_current_word()
    xmap <silent><M-d> <Plug>(coc-cursors-range)
    " use normal command like `<Leader>xi(`
    nmap <silent><M-c>  <Plug>(coc-cursors-operator)

    function! s:select_current_word()
      if !get(g:, 'coc_cursors_activated', 0)
        return "\<Plug>(coc-cursors-word)"
      endif
      return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
    endfunc
    " Use `:Format` for format current buffer
    command! -nargs=0 Format :call CocAction('format')

    nnoremap  <Leader>fz :<C-u>CocSearch -w<Space>
    " popup
    nmap ts <Plug>(coc-translator-p)
    vmap ts <Plug>(coc-translator-pv)

    " coc-explorer
    " nmap tt :CocCommand explorer<CR>
    " noremap <silent> tt :execute 'CocCommand explorer'
    "       \ ' --toggle' .
    "       \ ' --position=floating' .
    "       \ ' --sources=file+'<CR>
    " Introduce function text object
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap if <Plug>(coc-funcobj-i)
    omap af <Plug>(coc-funcobj-a)
  endif
  nmap gcj :execute 'CocCommand docthis.documentThis'<CR>
endfunction

function! s:load_clap() abort
  if utils#tap('vim-clap')
    nnoremap <silent> <Leader>tc :<C-u>Clap colors<CR>
    nnoremap <silent> <Leader>bb :<C-u>Clap buffers<CR>
    nnoremap <silent> <Leader>fa :<C-u>Clap grep<CR>
    nnoremap <silent> <Leader>fb :<C-u>Clap marks<CR>
    "like emacs counsel-find-file
    nnoremap <silent> <C-x><C-f> :<C-u>Clap filer<CR>
    nnoremap <silent> <Leader>ff :<C-u>Clap files ++finder=rg --ignore --hidden --files<cr>
    nnoremap <silent> <Leader>fg :<C-u>Clap gfiles<CR>
    nnoremap <silent> <Leader>fw :<C-u>Clap grep ++query=<cword><cr>
    nnoremap <silent> <Leader>fh :<C-u>Clap history<CR>
    nnoremap <silent> <Leader>fW :<C-u>Clap windows<CR>
    nnoremap <silent> <Leader>fl :<C-u>Clap loclist<CR>
    nnoremap <silent> <Leader>fu :<C-u>Clap git_diff_files<CR>
    nnoremap <silent> <Leader>fv :<C-u>Clap grep ++query=@visual<CR>
    nnoremap <silent> <Leader>oc :<C-u>Clap personalconf<CR>
  endif
endfunction

function! s:load_CompleteParameter() abort
  if utils#tap('CompleteParameter.vim')
    inoremap <silent><expr> ( complete_parameter#pre_complete("()")
    smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
    imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
    smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
    imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
  endif
endfunction

function! s:load_barbar_tabline() abort
  if utils#tap('barbar.nvim')
    " Magic buffer-picking mode
    nnoremap <silent> <C-s> :BufferPick<CR>
    " Sort automatically by...
    nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
    nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
    " Move to previous/next
    nnoremap <silent>    <A-,> :BufferPrevious<CR>
    nnoremap <silent>    <A-.> :BufferNext<CR>
    " Re-order to previous/next
    nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
    nnoremap <silent>    <A->> :BufferMoveNext<CR>
    " Goto buffer in position...
    " nnoremap <silent>    <A-1> :BufferGoto 1<CR>
    " nnoremap <silent>    <A-2> :BufferGoto 2<CR>
    " nnoremap <silent>    <A-3> :BufferGoto 3<CR>
    " nnoremap <silent>    <A-4> :BufferGoto 4<CR>
    " nnoremap <silent>    <A-5> :BufferGoto 5<CR>
    " nnoremap <silent>    <A-6> :BufferGoto 6<CR>
    " nnoremap <silent>    <A-7> :BufferGoto 7<CR>
    " nnoremap <silent>    <A-8> :BufferGoto 8<CR>
    " nnoremap <silent>    <A-9> :BufferLast<CR>
    " Close buffer
    nnoremap <silent>    <A-c> :BufferClose<CR>
  endif
endfunction

function! s:load_vim_which_key() abort
  if utils#tap('vim-which-key')
    nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
    nnoremap <silent> <localleader> :<c-u>WhichKey  ';'<CR>
  endif
endfunction


call s:load_default()
call s:load_dashboard()
call s:load_coc_clap()
call s:load_coc()
call s:load_clap()
call s:load_CompleteParameter()
call s:load_accelerated_jk()
call s:load_vim_which_key()
call s:load_barbar_tabline()
