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
    'glepnir/zephyr-nvim',
    lazy = false,
    priority = 1000,
    config = function ()
        vim.cmd[[colorscheme zephyr]]
    end
})

packadd({
    'nvim-tree/nvim-tree.lua',
    config = function()
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

packadd({
    'nvimdev/galaxyline.nvim',
    config = conf.galaxyline,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
})

packadd({
    'echasnovski/mini.indentscope',
    config = function ()
        require("mini.indentscope").setup({
            draw = {
                delay = 300,
                priority = 2
            }
        })
    end
})

-- packadd({
--     'lukas-reineke/indent-blankline.nvim',
--     config = conf.indent_blankline,
-- })
