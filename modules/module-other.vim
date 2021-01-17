" Bullets.vim
let g:bullets_enabled_file_types = [
			\ 'markdown',
			\ 'text',
			\ 'gitcommit',
			\ 'scratch'
			\]

" rainbow
let g:rainbow_active = 1

" Xkbswitch
let g:XkbSwitchEnabled = 1

" open-browser.vim
let g:netrw_nogx = 1

" spaceline.vim
" let g:spaceline_seperate_style= 'slant-cons'
" let g:spaceline_git_branch_icon= ' '

" vim-rooter
let g:rooter_patterns = ['__vim_project_root', '.git/']
let g:rooter_silent_chdir = 1

" | CTRLP (Dependency for omnisharp) |
let g:ctrlp_map = ''
let g:ctrlp_cmd = 'CtrlP'

" vim-illuminate
let g:Illuminate_delay = 750
hi illuminatedWord cterm=undercurl gui=undercurl

" suda.vim
cnoreabbrev sudowrite w suda://%
cnoreabbrev sw w suda://%

" vim jsx-pretty
let g:vim_jsx_pretty_colorful_config = 1

" vim-smoothie
let g:smoothie_no_default_mappings = v:true

" accelerated_jk
" let g:accelerated_jk_acceleration_table = [2, 4, 7, 15]
