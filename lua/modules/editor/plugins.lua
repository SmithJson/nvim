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

editor['numToStr/Comment.nvim'] = {
    config = conf.comment
}

editor['JoosepAlviste/nvim-ts-context-commentstring'] = {
}

editor['Chiel92/vim-autoformat'] = {
    run = {
        'npm install -g fixjson',
        'npm install -g lua-fmt',
        'pip3 install --upgrade autopep8'
    }
}

editor['dense-analysis/ale'] = {
}

return editor
