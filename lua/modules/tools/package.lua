local conf = require('modules.tools.config')

packadd({
  'Shatur/neovim-session-manager',
  config = conf.neovim_session_manager
})

packadd({
  'ggandor/leap.nvim',
  config = function()
    require('leap').add_default_mappings()
    require('leap').opts.highlight_unlabeled_phase_one_targets = true
  end,
  dependencies = { 'tpope/vim-repeat' }
})

packadd({
  'numToStr/Comment.nvim',
  config = function()
      require('Comment').setup({
          pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
      })
  end,
  dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' }
})

packadd({
  'folke/todo-comments.nvim',
  config = conf.todo_comments,
  dependencies = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
  }
})

packadd({
  'akinsho/toggleterm.nvim',
  version = '*',
  config = conf.toggleterm
})

packadd({
  'norcalli/nvim-colorizer.lua',
  event = 'BufRead',
  config = function()
      require('colorizer').setup()
  end,
})

packadd({
    'dhruvasagar/vim-table-mode',
    ft = { 'markdown', 'text' }
})

packadd({
    'mzlogin/vim-markdown-toc',
    ft = { 'markdown', 'gitignore' }
})

packadd({
  'kkoomen/vim-doge',
  event = 'BufRead',
  build = ':call doge#install()',
})

packadd({
  'ahonn/vim-fileheader'
})

packadd({
  'christoomey/vim-tmux-navigator'
})

packadd({
  'liuchengxu/vim-which-key'
})
