" https://github.com/liuchengxu/space-vim/blob/master/layers/+checkers/syntax-checking/config.vim#L12-L61
let g:ale_set_highlights = 0
let g:ale_fix_on_save = 1
let g:ale_echo_msg_format = '[#%linter%#] %s [%severity%]'
let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']

let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
" let g:ale_echo_msg_error_str = '✹ Error'
let g:ale_echo_msg_error_str = '✹ Error'
let g:ale_echo_msg_warning_str = '⚠ Warning'

let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1

let g:ale_fixers = {
    'javascript': ['eslint'],
    'javascriptreact': ['eslint'],
    'typescript': ['eslint'],
    'typescriptreact': ['eslint'],
}
