local conf = require('modules.ui.config')

packadd({
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = conf.dashboard,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
})

packadd({
    'lewis6991/gitsigns.nvim',
    event = { 'BufRead', 'BufNewFile' },
    config = conf.gitsigns,
})

packadd({
    'nvimdev/zephyr-nvim',
    config = function ()
        vim.cmd.colorscheme('zephyr')
    end
})

packadd({
    'nvim-tree/nvim-tree.lua',
    config = function ()
        require('nvim-tree').setup({
            trash = {
                cmd = "trash",
                require_confirm = true,
            }
        })
    end,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
})

packadd({
    'akinsho/bufferline.nvim',
    event = "BufReadPre",
    config = conf.bufferline,
    dependencies = { 'nvim-tree/nvim-web-devicons' }
})
