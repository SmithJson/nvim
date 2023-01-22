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
            pre_hook = function(ctx)
                local utils = require "Comment.utils"
                local location = nil
                if ctx.ctype == utils.ctype.blockwise then
                    location = require("ts_context_commentstring.utils").get_cursor_location()
                elseif ctx.cmotion == utils.cmotion.v or ctx.cmotion == utils.cmotion.V then
                    location = require("ts_context_commentstring.utils").get_visual_start_location()
                end

                return require("ts_context_commentstring.internal").calculate_commentstring {
                    key = ctx.ctype == utils.ctype.linewise and "__default" or "__multiline",
                    location = location,
                }
            end
        })
    end,
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

package({ 'dkarter/bullets.vim' })
