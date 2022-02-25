local ui = {}
local conf = require('modules.ui.config')

-- ui['glepnir/zephyr-nvim'] = {
-- }

ui['ayu-theme/ayu-vim'] = {
  config = function ()
      vim.cmd('let ayucolor="mirage"')
      vim.cmd('colorscheme ayu')
  end
}

ui['glepnir/dashboard-nvim'] = {
  config = conf.dashboard
}

ui['yamatsum/nvim-nonicons'] = {
  branch = 'main',
  requires = 'kyazdani42/nvim-web-devicons'
}

ui['glepnir/galaxyline.nvim'] = {
  branch = 'main',
  config = conf.galaxyline,
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
  -- cmd = {'NvimTreeToggle','NvimTreeOpen'},
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
