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

package({ 'ahonn/vim-fileheader' })

package({
  'hrsh7th/vim-eft',
  config = function()
    vim.g.eft_ignorecase = true
  end
})

package({
  'christoomey/vim-tmux-navigator',
})

package({
  'adelarsq/image_preview.nvim',
  config = function ()
    require("image_preview").setup({})
  end
})

package({
  'ggandor/leap.nvim',
  config = function ()
    require('leap').add_default_mappings()
    require('leap').opts.highlight_unlabeled_phase_one_targets = true
  end,
  requires = {
    { 'tpope/vim-repeat', opt = true },
  }
})

-- package({
--   'segeljakt/vim-silicon',
--   run = 'cargo install silicon'
-- })

package({
  'akinsho/toggleterm.nvim',
  tag = '*',
  config = conf.toggleterm
})

package({'liuchengxu/vim-which-key'})
