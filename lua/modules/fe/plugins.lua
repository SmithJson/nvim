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

package({'AndrewRadev/tagalong.vim'})
package({'dense-analysis/ale'})
