" vim-rooter
let g:rooter_patterns = ['__vim_project_root', '.git/']
let g:rooter_silent_chdir = 1

" vim-illuminate
let g:Illuminate_delay = 750
hi illuminatedWord cterm=undercurl gui=undercurl

" vim jsx-pretty
let g:vim_jsx_pretty_colorful_config = 1
let g:vim_jsx_pretty_highlight_close_tag = 1

" vim-smoothie
let g:smoothie_no_default_mappings = v:true

" accelerated_jk
let g:accelerated_jk_acceleration_table = [2, 4, 7, 15]

" vim-jsdoc
nmap <silent> <C-l> <Plug>(jsdoc)

" bracey.vim
let g:bracey_refresh_on_save = 1
let g:bracey_eval_on_save = 1

" lazygit.vim
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_use_neovim_remote = 1 " fallback to 0 if neovim-remote is not installed
nnoremap <silent> <leader>lg :LazyGit<CR>

" compe-tabnine
" let g:compe.source.tabnine = v:true

