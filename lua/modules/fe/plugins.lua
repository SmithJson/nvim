local package = require('core.pack').package
local conf = require('modules.fe.config')

local enable_emmet_filetype = {
    'html',
    'css',
    'javascript',
    'javascriptreact',
    'vue',
    'typescript',
    'typescriptreact'
}
package({
    'mattn/emmet-vim',
    event = 'InsertEnter',
    ft = enable_emmet_filetype,
    config = conf.emmet
})

package({
    'norcalli/nvim-colorizer.lua',
    event = 'BufRead',
    config = function()
        require('colorizer').setup()
    end,
})

package({
    'ray-x/web-tools.nvim',
    cmd = 'npm install -g browser-sync vscode-langservers-extracted',
    config = function()
        require'web-tools'.setup({
            keymaps = {
              rename = nil,
              repeat_rename = '.',
            },
        })
    end,
})

package({
    'mfussenegger/nvim-lint',
    config = conf.lint
})

package({'AndrewRadev/tagalong.vim'})

