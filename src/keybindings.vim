
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
  " noremap S :w<CR>
  " noremap Q :q<CR>
  "
  " Emacs keymap (insert mode cursor move)
  inoremap <C-a> <Home>
  inoremap <C-e> <End>
  inoremap <C-f> <Right>
  inoremap <C-b> <Left>
  inoremap <C-n> <Down>
  inoremap <C-p> <Up>

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

  "Markdown"
  autocmd Filetype markdown inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
  autocmd Filetype markdown inoremap <buffer> ,w <Esc>/ <++><CR>:nohlsearch<CR>"_c5l<CR>
  autocmd Filetype markdown inoremap <buffer> ,n ---<Enter><Enter>
  autocmd Filetype markdown inoremap <buffer> ,b **** <++><Esc>F*hi
  autocmd Filetype markdown inoremap <buffer> ,s ~~~~ <++><Esc>F~hi
  autocmd Filetype markdown inoremap <buffer> ,i ** <++><Esc>F*i
  autocmd Filetype markdown inoremap <buffer> ,d `` <++><Esc>F`i
  autocmd Filetype markdown inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
  autocmd Filetype markdown inoremap <buffer> ,m - [ ]
  autocmd Filetype markdown inoremap <buffer> ,p ![](<++>) <++><Esc>F[a
  autocmd Filetype markdown inoremap <buffer> ,a [](<++>) <++><Esc>F[a
  autocmd Filetype markdown inoremap <buffer> ,1 #<Space><Enter><++><Esc>kA
  autocmd Filetype markdown inoremap <buffer> ,2 ##<Space><Enter><++><Esc>kA
  autocmd Filetype markdown inoremap <buffer> ,3 ###<Space><Enter><++><Esc>kA
  autocmd Filetype markdown inoremap <buffer> ,4 ####<Space><Enter><++><Esc>kA
  autocmd Filetype markdown inoremap <buffer> ,l --------<Enter>
endfunction

function! s:load_dashboard() abort
  if utils#tap('dashboard-nvim')
    nnoremap <silent> <Leader>os  :<C-u>Dashboard<CR>
  endif
endfunction

function! s:telescope() abort
  if utils#tap('telescope.nvim')
    nnoremap <leader>ff <cmd>Telescope find_files find_command=rg,--hidden,--files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope oldfiles<cr>
    nnoremap <leader>fv <cmd>Telescope vim_options<cr>
  endif
endfunction

function! s:load_vim_which_key() abort
  if utils#tap('vim-which-key')
    nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
    nnoremap <silent> <localleader> :<c-u>WhichKey  ';'<CR>
  endif
endfunction

function! s:load_nvim_tree() abort
  if utils#tap('nvim-tree.lua')
    nnoremap <leader>e :NvimTreeToggle<CR>
    nnoremap <leader>r  :NvimTreeRefresh<CR>
    nnoremap <leader>f  :NvimTreeFindFile<CR>
  endif
endfunction

function! s:load_nvim_bufferline() abort
  if utils#tap('nvim-bufferline.lua')
    nnoremap <silent>[n :BufferLineCycleNext<CR>
    nnoremap <silent>p] :BufferLineCyclePrev<CR>
    nnoremap <silent> <C-s> :BufferLinePick<CR>
    nnoremap <silent> <C-w> :BufferLinePickClose<CR>
    " nnoremap <silent> <C-x><C-l> :BufferLineCloseLeft<CR>
    " nnoremap <silent> <C-x><C-r> :BufferLineCloseRight<CR>
  endif
endfunction

function! s:load_operator_surround() abort
  if utils#tap('vim-operator-surround')
    map <silent>sa <Plug>(operator-surround-append)
    map <silent>sd <Plug>(operator-surround-delete)
    map <silent>sr <Plug>(operator-surround-replace)
  endif
endfunction

function! s:load_lspsaga_nvim() abort
  if utils#tap('lspsaga.nvim')
    nnoremap <silent> gh :Lspsaga lsp_finder<CR>
    nnoremap <silent><leader>ca :Lspsaga code_action<CR>
    vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>
    nnoremap <silent>K :Lspsaga hover_doc<CR>
    nnoremap <silent> gs :Lspsaga signature_help<CR>
    nnoremap <silent>gr :Lspsaga rename<CR>
    nnoremap <silent> gd :Lspsaga preview_definition<CR>
    nnoremap <silent> [e :Lspsaga diagnostic_jump_next<CR>
    nnoremap <silent> ]e :Lspsaga diagnostic_jump_prev<CR>
    nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>
    nnoremap <silent> <C-k> <cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>
    tnoremap <silent> <C-k> <C-\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>
    highlight link LspSagaFinderSelection Search
  endif
endfunction

function! s:load_vim_eft() abort
  if utils#tap('vim-eft')
    nmap ; <Plug>(eft-repeat)
    xmap ; <Plug>(eft-repeat)

    nmap f <Plug>(eft-f)
    xmap f <Plug>(eft-f)
    omap f <Plug>(eft-f)
    nmap F <Plug>(eft-F)
    xmap F <Plug>(eft-F)
    omap F <Plug>(eft-F)

    nmap t <Plug>(eft-t)
    xmap t <Plug>(eft-t)
    omap t <Plug>(eft-t)
    nmap T <Plug>(eft-T)
    xmap T <Plug>(eft-T)
    omap T <Plug>(eft-T)
  endif
endfunction

function! s:load_vim_vsnip() abort
  imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
  smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

  " Expand or jump
  imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
  smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

  " Jump forward or backward
  imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
  smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
  imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
  smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

  " Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
  " See https://github.com/hrsh7th/vim-vsnip/pull/50
  nmap        s   <Plug>(vsnip-select-text)
  xmap        s   <Plug>(vsnip-select-text)
  nmap        S   <Plug>(vsnip-cut-text)
  xmap        S   <Plug>(vsnip-cut-text)
endfunction


call s:load_default()
call s:load_dashboard()
call s:telescope()
call s:load_vim_which_key()
call s:load_nvim_tree()
call s:load_nvim_bufferline()
call s:load_operator_surround()
call s:load_lspsaga_nvim()
call s:load_vim_eft()
call s:load_vim_vsnip()
