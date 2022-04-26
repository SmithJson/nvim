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
    config = conf.comment,
    requires = {'JoosepAlviste/nvim-ts-context-commentstring', opt = true}
}

editor['Chiel92/vim-autoformat'] = {
    run = {
        'npm install -g fixjson',
        'npm install -g eslint',
        'npm install -g lua-fmt',
        'npm install -g stylelint stylelint-config-standard',
        'pip3 install --upgrade autopep8'
    }
}

editor['dense-analysis/ale'] = {
}

return editor
