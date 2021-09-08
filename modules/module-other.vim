" vim-rooter
let g:rooter_patterns = ['__vim_project_root', '.git/']
let g:rooter_silent_chdir = 1

" vim-illuminate
let g:Illuminate_delay = 750
hi illuminatedWord cterm=undercurl gui=undercurl

" vim-smoothie
let g:smoothie_no_default_mappings = v:true

" accelerated_jk
let g:accelerated_jk_acceleration_table = [2, 4, 7, 15]

" vim-jsdoc
" nmap <silent> <C-l> <Plug>(jsdoc)

" bracey.vim
let g:bracey_refresh_on_save = 1
let g:bracey_eval_on_save = 1

" lazygit.vim
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_use_neovim_remote = 1 " fallback to 0 if neovim-remote is not installed
nnoremap <silent> <leader>lg :LazyGit<CR>

" let g:vim_dict_dict = [
"     \ '~/.vim/dict',
"     \ '~/.config/nvim/dict',
"     \ ]

" TODO: 修改 menus
" 清楚所有目录项目
call quickui#menu#reset()

" 安装一个 File 目录，使用 [名称，命令] 的格式表示各个选项。
call quickui#menu#install('&File', [
            \ [ "&New File\tCtrl+n", 'echo 0' ],
            \ [ "&Open File\t(F3)", 'echo 1' ],
            \ [ "&Close", 'echo 2' ],
            \ [ "--", '' ],
            \ [ "&Save\tCtrl+s", 'echo 3'],
            \ [ "Save &As", 'echo 4' ],
            \ [ "Save All", 'echo 5' ],
            \ [ "--", '' ],
            \ [ "E&xit\tAlt+x", 'echo 6' ],
            \ ])

" 每个项目还可以多包含一个字段，表示它的帮助文档，光标过去时会被显示到最下方的命令行
call quickui#menu#install('&Edit', [
            \ [ '&Copy', 'echo 1', 'help 1' ],
            \ [ '&Paste', 'echo 2', 'help 2' ],
            \ [ '&Find', 'echo 3', 'help 3' ],
            \ ])

" 在 %{...} 内的脚本会被求值并展开成字符串
call quickui#menu#install("&Option", [
			\ ['Set &Spell %{&spell? "Off":"On"}', 'set spell!'],
			\ ['Set &Cursor Line %{&cursorline? "Off":"On"}', 'set cursorline!'],
			\ ['Set &Paste %{&paste? "Off":"On"}', 'set paste!'],
			\ ])

" install 命令最后可以加一个 “权重”系数，用于决定目录位置，权重越大越靠右，越小越靠左
call quickui#menu#install('H&elp', [
			\ ["&Cheatsheet", 'help index', ''],
			\ ['T&ips', 'help tips', ''],
			\ ['--',''],
			\ ["&Tutorial", 'help tutor', ''],
			\ ['&Quick Reference', 'help quickref', ''],
			\ ['&Summary', 'help summary', ''],
			\ ], 10000)

" 打开下面选项，允许在 vim 的下面命令行部分显示帮助信息
let g:quickui_show_tip = 1

" 定义按两次空格就打开上面的目录
noremap <space><space> :call quickui#menu#open()<cr>
