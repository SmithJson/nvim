local ui = {}
local conf = require('modules.ui.config')


-- ui['liuchengxu/space-vim-theme'] = {
--   config = function ()
--       vim.cmd('colorscheme space_vim_theme')
--   end
-- }

-- ui['SmithJson/zephyr-nvim'] = {
--   config = function ()
--       vim.cmd('colorscheme zephyr')
--   end
-- }

-- ui['ayu-theme/ayu-vim'] = {
--   config = function ()
--       vim.cmd('let ayucolor="mirage"')
--       vim.cmd('colorscheme ayu')
--   end
-- }
--
ui['Mofiqul/vscode.nvim'] = {
  config = function ()
vim.g.vscode_style = "dark"
-- Enable transparent background
vim.g.vscode_transparent = 1
-- Enable italic comment
vim.g.vscode_italic_comment = 1
-- Disable nvim-tree background color
vim.g.vscode_disable_nvimtree_bg = true
vim.cmd([[colorscheme vscode]])
  end
}


ui['glepnir/dashboard-nvim'] = {
  config = conf.dashboard,
  run = 'cargo install ripgrep'
}

ui['yamatsum/nvim-nonicons'] = {
  branch = 'main',
  requires = 'kyazdani42/nvim-web-devicons'
}

ui['lukas-reineke/indent-blankline.nvim'] = {
  event = 'BufRead',
  config = conf.indent_blakline
}

ui['akinsho/nvim-bufferline.lua'] = {
  config = conf.nvim_bufferline,
  requires = 'yamatsum/nvim-nonicons'
}

ui['kyazdani42/nvim-tree.lua'] = {
  config = conf.nvim_tree,
  requires = 'yamatsum/nvim-nonicons'
}

ui['airblade/vim-rooter'] = {
  config = conf.rooter,
}

ui['nvim-lualine/lualine.nvim'] = {
  config = function ()
      require('lualine').setup({
          options = { theme = "vscode" }
      })
  end,
}

-- ui['datwaft/bubbly.nvim'] = {
--   config = conf.bubbly,
--   requires = 'nvim-lua/lsp-status.nvim'
-- }

ui['lewis6991/gitsigns.nvim'] = {
  event = {'BufRead','BufNewFile'},
  config = conf.gitsigns,
  requires = {'nvim-lua/plenary.nvim',opt=true}
}

ui['sindrets/diffview.nvim'] = {
  config = conf.diffview,
  requires = {
    {'nvim-lua/plenary.nvim'},
    {'kyazdani42/nvim-web-devicons'}
  },
  cmd={ 'DiffviewOpen',
      'DiffviewFileHistory',
      'DiffviewClose',
      'DiffviewToggleFiles',
      'DiffviewFocusFiles',
      'DiffviewRefresh'
  },
  after='plenary.nvim'
}

return ui
