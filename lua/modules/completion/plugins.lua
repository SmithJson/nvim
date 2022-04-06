local completion = {}
local conf = require('modules.completion.config')

completion['neovim/nvim-lspconfig'] = {
  config = conf.nvim_lsp
}

completion['williamboman/nvim-lsp-installer'] = {
    opt = true,
    cmd = {'LspInstall', 'LspUninstall'}
}

completion['tami5/lspsaga.nvim'] = {
    opt = true,
    cmd = 'Lspsaga',
    config = conf.saga
}

completion['ray-x/lsp_signature.nvim'] = {
    opt = true,
    after = 'nvim-lspconfig'
}

completion['hrsh7th/nvim-compe'] = {
    opt = true,
    event = 'InsertEnter',
    after = 'nvim-lspconfig',
    config = conf.compe
}

completion['onsails/lspkind-nvim'] = {
    opt = true,
    event = 'BufRead',
    config = conf.lspkind
}

completion['ray-x/lsp_signature.nvim'] = {
    opt = true,
    after = 'nvim-lspconfig'
}

completion['hrsh7th/vim-vsnip-integ'] = {
    opt = true,
    after = 'nvim-compe',
    config=conf.vsnip,
    requires = {'hrsh7th/vim-vsnip', opt = true, event = 'InsertCharPre' }
}

completion['windwp/nvim-autopairs'] = {
    opt = true,
    event = 'InsertCharPre',
    after = 'nvim-lspconfig',
    config = conf.autopairs
}

return completion
