local config = {}

function config.telescope()
    if not packer_plugins['plenary.nvim'].loaded then
      vim.cmd([[packadd plenary.nvim]])
      vim.cmd([[packadd telescope-fzy-native.nvim]])
      vim.cmd([[packadd telescope-file-browser.nvim]])
    end
    local fb_actions = require('telescope').extensions.file_browser.actions
    require('telescope').setup({
      defaults = {
        prompt_prefix = '🔭 ',
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

function config.session()
  if not packer_plugins["plenary.nvim"].loaded then
      vim.cmd [[packadd plenary.nvim]]
  end
  local Path = require("plenary.path")
  require("session_manager").setup({
      sessions_dir = Path:new(vim.fn.stdpath("data"), "sessions"),
      path_replacer = "__",
      colon_replacer = "++",
      autoload_mode = require("session_manager.config").AutoloadMode.CurrentDir,
      autosave_last_session = true,
      autosave_ignore_not_normal = true,
      autosave_ignore_filetypes = {
          "gitcommit"
      },
      autosave_only_in_session = false,
      max_path_length = 80
  })
end

function config.toggleterm()
  require("toggleterm").setup({
    size = function(term)
      if term.direction == "horizontal" then
          return 15
      elseif term.direction == "vertical" then
          return vim.o.columns * 0.40
      end
    end,
    hide_numbers = false,
    start_in_insert = false,
    open_mapping = [[<c-\>]],
    direction = "vertical",
  })
end

return config