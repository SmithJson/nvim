fu! SaveSess()
    execute 'mksession! ' . $HOME . '/.cache/nvim/session.vim'
endfunction

fu! RestoreSess()
if filereadable($HOME . '/.cache/nvim/session.vim')
    execute 'source ' . $HOME . '/.cache/nvim/session.vim'
endif
endfunction

autocmd VimLeave * call SaveSess()
autocmd VimEnter * nested call RestoreSess()
