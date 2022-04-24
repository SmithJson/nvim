local ui = {}
local conf = require('modules.ui.config')


-- ui['liuchengxu/space-vim-theme'] = {
--   config = function ()
--       vim.cmd('colorscheme space_vim_theme')
--   end
-- }

ui['SmithJson/zephyr-nvim'] = {
  config = function ()
      vim.cmd('colorscheme zephyr')
  end
}

-- ui['ayu-theme/ayu-vim'] = {
--   config = function ()
--       vim.cmd('let ayucolor="mirage"')
--       vim.cmd('colorscheme ayu')
--   end
-- }

ui['glepnir/dashboard-nvim'] = {
  config = conf.dashboard,
  run = 'cargo install ripgrep'
}

ui['yamatsum/nvim-nonicons'] = {
  branch = 'main',
  requires = 'kyazdani42/nvim-web-devicons'
}

-- ui['glepnir/galaxyline.nvim'] = {
--   branch = 'main',
--   config = conf.galaxyline,
--   requires = 'yamatsum/nvim-nonicons'
-- }

ui['feline-nvim/feline.nvim'] = {
  config = conf.feline,
  requires = 'yamatsum/nvim-nonicons'
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

ui['lewis6991/gitsigns.nvim'] = {
  event = {'BufRead','BufNewFile'},
  config = conf.gitsigns,
  requires = {'nvim-lua/plenary.nvim',opt=true}
}

return ui
