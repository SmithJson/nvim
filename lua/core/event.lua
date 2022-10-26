local vim = vim
local autocmd = {}

function autocmd.nvim_create_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        vim.api.nvim_command('augroup ' .. group_name)
        vim.api.nvim_command('autocmd!')
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten {'autocmd', def}, ' ')
            vim.api.nvim_command(command)
        end
        vim.api.nvim_command('augroup END')
    end
end

local definitions = {
    buffers = {
        -- Reload vim config automatically
        {'BufWritePost', [[$VIM_PATH/{*.vim,*.yaml,vimrc} nested source $MYVIMRC | redraw]]},
        -- Reload Vim script automatically if setlocal autoread
        {'BufWritePost,FileWritePost', '*.vim',
        [[nested if &l:autoread > 0 | source <afile> | echo 'source ' . bufname('%') | endif]]},
        -- Update filetype on save if empty
        {'BufWritePost', '*', [[nested if &l:filetype ==# '' || exists('b:ftdetect') | unlet! b:ftdetect | filetype detect | endif]]},
        -- Automatically set read-only for files being edited elsewhere
        {'SwapExists', '*', [[nested let v:swapchoice = 'o']]},
        {'BufWritePre', '/tmp/*', 'setlocal noundofile'},
        {'BufWritePre', 'COMMIT_EDITMSG', 'setlocal noundofile'},
        {'BufWritePre', 'MERGE_MSG', 'setlocal noundofile'},
        {'BufWritePre', '*.tmp', 'setlocal noundofile'},
        {'BufWritePre', '*.bak', 'setlocal noundofile'}
    },

    window = {
        -- Highlight current line only on focused window
        {'WinEnter,BufEnter,InsertLeave', '*', [[if ! &cursorline && &filetype !~# '^\(dashboard\|clap_\)' && ! &pvw | setlocal cursorline | endif]]},
        {'WinLeave,BufLeave,InsertEnter', '*', [[if &cursorline && &filetype !~# '^\(dashboard\|clap_\)' && ! &pvw | setlocal nocursorline | endif]]},
        -- Force write shada on leaving nvim
        {'VimResized', '*', [[tabdo wincmd =]]}, 
        {'VimLeave', '*', [[if has('nvim') | wshada! | else | wviminfo! | endif]]},
        -- Check if file changed when its window is focus, more eager than 'autoread'
        {'FocusGained', '*', [[checktime]]}
    },

    filetype = {
        {'FileType', 'dashboard', [[set showtabline=0 | autocmd BufLeave <buffer> set showtabline=2]]}
    },

    yank = {
        {'TextYankPost', '*', [[silent! lua vim.highlight.on_yank({higroup='IncSearch', timeout=400})]]}
    }
}

autocmd.nvim_create_augroups(definitions)