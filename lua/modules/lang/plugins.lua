local package = require('core.pack').package
local conf = require('modules.lang.config')

package({
    'nvim-treesitter/nvim-treesitter',
    event = 'BufRead',
    run = ':TSUpdate',
    after = 'telescope.nvim',
    config = conf.nvim_treesitter,
})

package({
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup({
            pre_hook =  require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
        })
    end,
    after = 'nvim-ts-context-commentstring',
    requires = {{ 'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter' }}
})

package({
    'folke/todo-comments.nvim',
    config = conf.todo_comments,
    requires = {
        { 'nvim-lua/popup.nvim', opt = true },
        { 'nvim-lua/plenary.nvim', opt = true }
    }
})

package({
    'iamcco/markdown-preview.nvim',
    ft = 'markdown',
    cmd = 'MarkdownPreview',
    run = 'cd app && npm install'
})

package({
    'dhruvasagar/vim-table-mode',
    ft = { 'markdown', 'text' }
})

package({
    'mzlogin/vim-markdown-toc',
    ft = { 'markdown', 'gitignore' }
})

package({
    'jose-elias-alvarez/null-ls.nvim',
    config = conf.null_ls,
    after = 'nvim-lspconfig'
})

-- 与 lspsaga outline 的 o 键位冲突
package({
    'dkarter/bullets.vim',
    ft = 'markdown'
})
