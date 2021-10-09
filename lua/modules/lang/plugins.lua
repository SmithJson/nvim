local lang = {}
local conf = require('modules.lang.config')

lang['iamcco/markdown-preview.nvim'] = {
    opt = true,
    ft = "markdown",
    cmd = 'MarkdownPreview',
    run = 'cd app && npm install'
}

lang['dhruvasagar/vim-table-mode'] = {
    opt = true,
    ft = {'text', 'markdown'}
}

lang['mzlogin/vim-markdown-toc'] = {
    opt = true,
    ft = {'gitignore', 'markdown'}
}

lang['dkarter/bullets.vim'] = {
}

lang['nvim-treesitter/nvim-treesitter'] = {
  config = conf.nvim_treesitter,
}

lang['nvim-treesitter/nvim-treesitter-textobjects'] = {
  after = 'nvim-treesitter'
}

return lang
