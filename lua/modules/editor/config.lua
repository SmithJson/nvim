local config = {}

function config.auto_pairs()
  require('nvim-autopairs').setup({
    map_cr = false,
  })
end

function config.telescope()
  local fb_actions = require('telescope').extensions.file_browser.actions
  require('telescope').setup({
    defaults = {
      prompt_prefix = ' ',
      selection_caret = ' ',
      layout_config = {
        horizontal = { prompt_position = 'top', results_width = 0.6 },
        vertical = { mirror = false },
      },
      sorting_strategy = 'ascending',
      file_previewer = require('telescope.previewers').vim_buffer_cat.new,
      grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
      qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    },
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      },
      file_browser = {
        mappings = {
          ['n'] = {
            ['c'] = fb_actions.create,
            ['r'] = fb_actions.rename,
            ['d'] = fb_actions.remove,
            ['o'] = fb_actions.open,
            ['u'] = fb_actions.goto_parent_dir,
          },
        },
      },
    },
  })
  require('telescope').load_extension('fzy_native')
  require('telescope').load_extension('file_browser')
end

function config.nvim_treesitter()
  vim.opt.foldmethod = 'expr'
  vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

  require('nvim-treesitter.configs').setup({
    ensure_installed = { 'json', 'jsonc', 'vue', 'html', 'javascript', 'typescript', 'vim', 'bash', 'c', 'cpp', 'css' },
    highlight = {
      enable = true,
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false
    }
  })
end

function config.emmet()
  vim.g.user_emmet_complete_tag = 1
  vim.g.user_emmet_install_global = 1
  vim.g.user_emmet_install_command = 1
  vim.g.user_emmet_mode = 'i'
end

return config
