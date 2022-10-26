local package = require('core.pack').package
local conf = require('modules.ui.config')

package({
    'glepnir/zephyr-nvim',
    config = function()
        vim.cmd('colorscheme zephyr')
    end
})

package({
    'glepnir/dashboard-nvim',
    config = conf.dashboard
})

package({
    'glepnir/galaxyline.nvim',
    branch = 'main',
    config = conf.galaxyline,
    requires = 'kyazdani42/nvim-web-devicons',
})

local enable_indent_filetype = {
    'go',
    'lua',
    'sh',
    'rust',
    'cpp',
    'typescript',
    'typescriptreact',
    'javascript',
    'json',
    'python',
}
package({
    'lukas-reineke/indent-blankline.nvim',
    ft = enable_indent_filetype,
    config = conf.indent_blankline,
})

package({
    'lewis6991/gitsigns.nvim',
    event = { 'BufRead', 'BufNewFile' },
    config = conf.gitsigns,
    requires = {{ 'nvim-lua/plenary.nvim', opt = true }}
})

package({
    'sindrets/diffview.nvim',
    after = 'plenary.nvim',
    cmd = {
        "DiffviewOpen",
        "DiffviewFileHistory",
        "DiffviewClose",
        "DiffviewToggleFiles",
        "DiffviewFocusFiles",
        "DiffviewRefresh"
    },
    requires = {
        {'nvim-lua/plenary.nvim', opt = true},
        {'kyazdani42/nvim-web-devicons', opt = true}
    }
})

package({
    'petertriho/nvim-scrollbar',
    config = function()
        require("scrollbar").setup()
    end
})

package({
    'nvim-tree/nvim-tree.lua',
    requires = {{ 'nvim-tree/nvim-web-devicons' }},
    config = function()
        require('nvim-tree').setup({
            trash = {
                cmd = "trash",
                require_confirm = true,
            }
        })
    end
})

package({
    'romgrk/barbar.nvim',
    config = conf.barbar,
    requires = {{ 'kyazdani42/nvim-web-devicons' }}
})