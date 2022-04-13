local editor = {}
local conf = require('modules.editor.config')

editor['itchyny/vim-cursorword'] = {
    event = {'BufReadPre','BufNewFile'},
    config = conf.vim_cursorwod
}

editor['mattn/emmet-vim'] = {
    event = 'InsertEnter',
    ft = {'html','css','javascript','javascriptreact','vue','typescript','typescriptreact'},
    config = conf.emmet,
}

editor['norcalli/nvim-colorizer.lua'] = {
    opt = true,
    event = 'BufRead',
    config = conf.nvim_colorizer
}

editor['rhysd/vim-operator-surround'] = {
    event = 'BufRead',
    requires = 'kana/vim-operator-user'
}

editor['terrortylor/nvim-comment'] = {
    config = function ()
        require('nvim_comment').setup()
    end
}


editor['Chiel92/vim-autoformat'] = {
}

editor['dense-analysis/ale'] = {
}

return editor
