local package = require('core.pack').package
local conf = require('modules.tools.config')

package({
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    config = conf.telescope,
    requires = {
      { 'nvim-lua/plenary.nvim', opt = true },
      { 'nvim-telescope/telescope-fzy-native.nvim', opt = true },
      { 'nvim-telescope/telescope-file-browser.nvim', opt = true }
    }
})

package({
  'Shatur/neovim-session-manager',
  config = conf.session
})

package({
  'hrsh7th/vim-eft',
  config = function()
    vim.g.eft_ignorecase = true
  end
})

package({
  'chentoast/marks.nvim',
  config = function()
    require'marks'.setup {}
  end
})

package({
  'segeljakt/vim-silicon',
  run = 'cargo install silicon'
})

package({
  'akinsho/toggleterm.nvim',
  tag = '*',
  config = conf.toggleterm
})

package({'liuchengxu/vim-which-key'})