" let g:dashboard_preview_command = 'cat'
" let g:dashboard_preview_file = '~/.config/nvim/dashboard.cat'
" let g:dashboard_preview_file_height = 10
" let g:dashboard_preview_file_width = 80

" create ascii text：http://patorjk.com/software/taag/
let g:dashboard_default_executive ='telescope'
let g:dashboard_custom_header = [
      \ '',
      \ '',
      \'███████╗██╗   ██╗ █████╗     ██╗     ██╗██╗     ██╗████████╗██╗  ██╗',
      \'██╔════╝██║   ██║██╔══██╗    ██║     ██║██║     ██║╚══██╔══╝██║  ██║',
      \'█████╗  ██║   ██║███████║    ██║     ██║██║     ██║   ██║   ███████║',
      \'██╔══╝  ╚██╗ ██╔╝██╔══██║    ██║     ██║██║     ██║   ██║   ██╔══██║',
      \'███████╗ ╚████╔╝ ██║  ██║    ███████╗██║███████╗██║   ██║   ██║  ██║',
      \'╚══════╝  ╚═══╝  ╚═╝  ╚═╝    ╚══════╝╚═╝╚══════╝╚═╝   ╚═╝   ╚═╝  ╚═╝',
      \ '',
      \ '                           [  辩机 ]     ',
      \ ]

let g:dashboard_custom_footer = [
			\'  Email   : stone_fe@163.com                 ',
			\'',
			\'  Github  : SmithJson     ',
      \'',
			\]

let g:dashboard_custom_section = {
   \ 'last_session'        :{
      \ 'description': ['  Reload last session                   SPC s l'],
      \ 'command': 'SessionLoad'},
   \ 'find_history'        :{
      \ 'description': ['  Recently opened files                 SPC f h'],
      \ 'command': 'DashboardFindHistory'},
   \ 'find_file'           :{
      \ 'description': ['  Find File                             SPC f f'],
      \ 'command': 'DashboardFindFile'},
   \ 'change_colorscheme'  :{
      \ 'description': ['  Change Colorscheme                    SPC t c'],
      \ 'command': 'DashboardChangeColorscheme'},
   \ 'find_word'           :{
      \ 'description': ['  Find word                             SPC f w'],
      \ 'command': 'DashboardFindWord'},
   \ 'book_marks'          :{
      \ 'description': ['  Jump to bookmark                      SPC f b'],
      \ 'command': 'DashboardJumpMarks'},
   \ 'open_personal'       :{
      \ 'description': ['  Open Personal Config File             SPC o c'],
      \ 'command': 'Clap personalconf'},
   \}
