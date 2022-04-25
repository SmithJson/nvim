local completion = {}
local conf = require('modules.completion.config')

completion['neovim/nvim-lspconfig'] = {
    config = conf.nvim_lsp
}

completion['williamboman/nvim-lsp-installer'] = {
    opt = true,
    cmd = {'LspInstall', 'LspUninstall'}
}

completion['j-hui/fidget.nvim'] = {
    config = function()
        require"fidget".setup{}
    end
}

completion['tami5/lspsaga.nvim'] = {
    opt = true,
    cmd = 'Lspsaga',
    config = conf.saga
}

completion['hrsh7th/nvim-cmp'] = {
    opt = true,
    event = 'InsertEnter',
    config = conf.compe,
    requires = {
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'hrsh7th/cmp-cmdline'},

        {'hrsh7th/cmp-vsnip'},
        {'hrsh7th/vim-vsnip'},
        {'petertriho/cmp-git'},
        {'hrsh7th/cmp-nvim-lsp-signature-help'},
        {'onsails/lspkind-nvim'},
        {'lukas-reineke/cmp-rg'},
    }
}


completion['hrsh7th/vim-vsnip-integ'] = {
    opt = true,
    after = 'nvim-cmp',
    config=conf.vsnip,
    requires = {
        {'rafamadriz/friendly-snippets', opt = true, event = 'InsertCharPre'},
    }
}

completion['windwp/nvim-autopairs'] = {
    opt = true,
    event = 'InsertCharPre',
    after = 'nvim-lspconfig',
    config = conf.autopairs
}

return completion
