" vim-rooter
let g:rooter_patterns = ['__vim_project_root', '.git/']
let g:rooter_silent_chdir = 1

" bracey.vim
let g:bracey_refresh_on_save = 1
let g:bracey_eval_on_save = 1

" lazygit.vim
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_use_neovim_remote = 1 " fallback to 0 if neovim-remote is not installed
nnoremap <silent> <leader>gg :LazyGit<CR>

" easymotion.vim
nmap <leader>s <Plug>(easymotion-s2)

let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript', 'typescrip', 'typescriptreact']
let g:vsnip_filetypes.typescriptreact = ['javascript', 'typescrip', 'javascriptreact']
let g:vsnip_filetypes.javascript = ['typescript', 'javascriptreact', 'typescriptreact']
let g:vsnip_filetypes.typescript = ['javascript', 'javascriptreact', 'typescriptreact']
