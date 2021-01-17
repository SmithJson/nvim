" Gopls config
if utils#tap('go-nvim')
  autocmd FileType go LSP 'go'
endif

" ccls config
if utils#tap('vim-lsp-cxx-highlight')
  autocmd FileType c LSP 'c/cpp'
  autocmd FileType cpp LSP 'c/cpp'
endif

"python lsp config
if utils#tap('python-syntax')
    let g:python_highlight_all = 1
    call coc#add_extension('coc-python')
endif

"docker lsp config
if utils#tap('Dockerfile.vim')
  autocmd FileType Dockerfile LSP 'dockerfile'
endif

"haskell lsp config
if utils#tap('haskell-vim')
  autocmd FileType haskell LSP 'haskell'
endif

"lua lsp config
"https://github.com/Alloyed/lua-lsp
if utils#tap('vim-lua')
    call coc#config('languageserver', {
      \ 'lua': {
        \ "command": "lua-lsp",
        \ "filetypes": ["lua"],
        \ }
        \})
endif

"javascript lsp config
if utils#tap('vim-js')
  call coc#add_extension('coc-tsserver','coc-eslint','coc-prettier','coc-docthis')
endif

if utils#tap('yats.vim')
    call coc#add_extension('coc-tsserver','coc-eslint', 'coc-prettier', 'coc-tslint-plugin' ,'coc-docthis')
endif

"php lsp config
if utils#tap('php.vim')
  autocmd FileType php LSP 'php'
endif

"shell lsp config
if utils#tap('vim-sh')
  autocmd FileType sh,zsh LSP 'sh'
endif

"R lsp config
if utils#tap('Nvim-R')
    call coc#add_extension('coc-r-lsp')
endif

"Ruby lsp config
if utils#tap('vim-ruby')
    call coc#add_extension('coc-solargraph')
endif

"Rust lsp config
if utils#tap('rust.vim')
    call coc#add_extension('coc-rust-analyzer')
endif

"Scala lsp config
if utils#tap('vim-scala')
    call coc#add_extension('coc-metals')
endif

"vue lsp config
if utils#tap('vim-vue')
    call coc#add_extension('coc-vetur')
endif

"Dart lsp config
if utils#tap('dart-vim-plugin')
  call coc#add_extension('coc-flutter')
endif

if utils#tap('sql.vim')
  call coc#add_extension('coc-sql')
endif

