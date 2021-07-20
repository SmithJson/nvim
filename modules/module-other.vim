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
" let g:XkbSwitchEnabled = 1

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

" md-img-paste.vim
let g:mdip_imgdir = 'images'

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'dashboard', 'defx']
let g:indent_guides_auto_colors = 1

" vim-better-whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:better_whitespace_filetypes_blacklist=['help', 'dashboard', 'defx']
