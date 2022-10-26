local package = require('core.pack').package
local conf = require('modules.lang.config')

package({
    'editorconfig/editorconfig-vim',
    ft = { 'go', 'typescript', 'javascript', 'vim', 'rust', 'zig', 'c', 'cpp' },
})

package({
    'nvim-treesitter/nvim-treesitter',
    event = 'BufRead',
    run = ':TSUpdate',
    after = 'telescope.nvim',
    config = conf.nvim_treesitter,
})

package({
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter'
})

package({
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
})

package({
    'JoosepAlviste/nvim-ts-context-commentstring',
    after = 'nvim-treesitter'
})

-- package({})