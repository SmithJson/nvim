local tools = {}
local conf = require('modules.tools.config')

tools['editorconfig/editorconfig-vim'] = {
    ft = { 'go','typescript','javascript','vim','vue','rust','zig','c','cpp' }
}

tools['nvim-telescope/telescope.nvim'] = {
    opt = true,
    cmd = 'Telescope',
    config = conf.telescope,
    requires = {
        {'nvim-lua/popup.nvim', opt = true},
        {'nvim-lua/plenary.nvim', opt = true}
    }
}

tools['folke/todo-comments.nvim'] = {
    config = conf.todo_comments,
    requires = {
        {'nvim-lua/popup.nvim', opt = true},
        {'nvim-lua/plenary.nvim', opt = true}
    }
}

tools['nvim-telescope/telescope-fzy-native.nvim'] = {
    opt = true,
    after = 'telescope.nvim'
}

tools['nvim-telescope/telescope-project.nvim'] = {
    opt = true,
    after = 'telescope.nvim'
}

tools['nvim-telescope/telescope-frecency.nvim'] = {
    opt = true,
    after = 'telescope.nvim',
    requires = {{'tami5/sql.nvim', opt = true}}
}

tools['simrat39/symbols-outline.nvim'] = {
    config = conf.symbols_outline,
}

tools['liuchengxu/vim-which-key'] = {
}

tools["dstein64/vim-startuptime"] = {
    opt = true,
    cmd = "StartupTime"
}

tools['turbio/bracey.vim'] = {
    run = 'npm install --prefix server'
}

tools['segeljakt/vim-silicon'] = {
    run = 'cargo install silicon'
}

tools['hrsh7th/vim-eft'] = {
    opt = true,
    config = function()
        vim.g.eft_ignorecase = true
    end
}

tools['easymotion/vim-easymotion'] = {
}

tools['skywind3000/vim-terminal-help'] = {
}

tools['ahonn/vim-fileheader'] = {
}

tools['AndrewRadev/tagalong.vim'] = {
}

tools['skywind3000/asynctasks.vim'] = {
    opt = true,
    cmd = {'AsyncRun', 'AsyncStop'},
    requires = {{'skywind3000/asyncrun.vim', opt = true}}
}

return tools
