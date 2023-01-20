local package = require('core.pack').package
local conf = require('modules.lang.config')

local function ts_context_commentstring_create_pre_hook(ctx)
    local U = require 'Comment.utils'
    -- Determine whether to use linewise or blockwise commentstring
    local type = ctx.ctype == U.ctype.linewise and '__default' or '__multiline'

    -- Determine the location where to calculate commentstring from
    local location = nil
    if ctx.ctype == U.ctype.blockwise then
      location = {
        ctx.range.srow - 1,
        ctx.range.scol,
      }
    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
      location = require('ts_context_commentstring.utils').get_visual_start_location()
    end

    return require('ts_context_commentstring.internal').calculate_commentstring {
      key = type,
      location = location,
    }
end

package({
    'nvim-treesitter/nvim-treesitter',
    event = 'BufRead',
    run = ':TSUpdate',
    after = 'telescope.nvim',
    config = conf.nvim_treesitter,
})

-- package({
--     'nvim-treesitter/nvim-treesitter-textobjects',
--     after = 'nvim-treesitter'
-- })

package({
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup ({
            pre_hook = ts_context_commentstring_create_pre_hook
        })
    end
})


package({
    'JoosepAlviste/nvim-ts-context-commentstring',
    after = 'nvim-treesitter'
})

package({
    'folke/todo-comments.nvim',
    config = conf.todo_comments,
    requires = {
        {'nvim-lua/popup.nvim', opt = true},
        {'nvim-lua/plenary.nvim', opt = true}
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

-- package({
--     'jose-elias-alvarez/null-ls.nvim',
--     config = conf.null_ls
-- })

package({ 'dkarter/bullets.vim' })
