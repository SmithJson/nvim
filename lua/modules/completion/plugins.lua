local package = require('core.pack').package
local conf = require('modules.completion.config')

local enable_lsp_filetype = { 'go', 'lua', 'sh', 'rust', 'c', 'cpp', 'zig', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'json', 'python', 'vue' }

package({
    'neovim/nvim-lspconfig',
    event = "BufReadPre",
    ft = enable_lsp_filetype,
    config = conf.nvim_lsp,
})

package({
    'williamboman/mason.nvim',
    config = function()
        require('mason').setup()
    end
})

package({
    'williamboman/mason-lspconfig.nvim',
    config = function()
        require('mason-lspconfig').setup({
            ensure_installed = { 'tsserver', 'vuels' },
            automatic_installation = true
        })
    end
})

package({
    'glepnir/lspsaga.nvim',
    event = 'BufRead',
    branch = "main",
    config = conf.lspsaga
})


package({
    'hrsh7th/nvim-cmp',
    event = { "InsertEnter", "CmdlineEnter" },
    config = conf.nvim_cmp,
    requires = {
        { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-lspconfig' },
        { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp'},
        { 'hrsh7th/cmp-vsnip', after = 'vim-vsnip' }
    },
})

package({
    'hrsh7th/vim-vsnip',
    event = 'InsertCharPre',
    config = conf.vsnip
})

package({
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = conf.auto_pairs
})

package({
    'j-hui/fidget.nvim',
    config = function()
        require"fidget".setup {}
    end
})
