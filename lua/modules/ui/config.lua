local config = {}

function config.galaxyline()
  require('modules.ui.eviline')
end

function config.dashboard()
  local db = require('dashboard')
  db.setup({
    theme = 'hyper',
    disable_move = true,
    config = {
      footer = { "" },
      header = {
        "███████╗██╗   ██╗ █████╗     ██╗     ██╗██╗     ██╗████████╗██╗  ██╗",
        "██╔════╝██║   ██║██╔══██╗    ██║     ██║██║     ██║╚══██╔══╝██║  ██║",
        "█████╗  ██║   ██║███████║    ██║     ██║██║     ██║   ██║   ███████║",
        "██╔══╝  ╚██╗ ██╔╝██╔══██║    ██║     ██║██║     ██║   ██║   ██╔══██║",
        "███████╗ ╚████╔╝ ██║  ██║    ███████╗██║███████╗██║   ██║   ██║  ██║",
        "╚══════╝  ╚═══╝  ╚═╝  ╚═╝    ╚══════╝╚═╝╚══════╝╚═╝   ╚═╝   ╚═╝  ╚═╝",
        "",
        "[  辩机 ]     ",
        ""
      },
      week_header = {
        enable = false,
      },
      shortcut = {
        {
          desc = ' Update',
          group = '@property',
          action = 'PackerSync',
          key = 'u'
        },
        {
          desc = ' Files',
          group = 'Label',
          action = 'Telescope find_files',
          key = 'f',
        },
        {
          desc = ' Recently',
          group = 'Number',
          action = ':SessionManager load_current_dir_session',
          key = 'l',
        }
      },
    },
  })
end

function config.indent_blankline()
  vim.g.indent_blankline_filetype_exclude = {
    "startify",
    "dashboard",
    "dotooagenda",
    "log",
    "fugitive",
    "gitcommit",
    "packer",
    "vimwiki",
    "markdown",
    "txt",
    "vista",
    "help",
    "todoist",
    "NvimTree",
    "peekaboo",
    "git",
    "TelescopePrompt",
    "undotree",
    "flutterToolsOutline",
    "" -- for all buffers without a file type
  }
  vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
  vim.g.indent_blankline_show_trailing_blankline_indent = false
  vim.cmd [[highlight IndentBlanklineIndent1 guibg=#40433d gui=nocombine]]
  vim.cmd [[highlight IndentBlanklineIndent2 guibg=#384341 gui=nocombine]]
  vim.cmd [[highlight IndentBlanklineIndent3 guibg=#3e3a4b gui=nocombine]]
  vim.cmd [[highlight IndentBlanklineIndent4 guibg=#3b4852 gui=nocombine]]
  require("indent_blankline").setup {
    char = "",
    char_highlight_list = {
      "IndentBlanklineIndent1",
      "IndentBlanklineIndent2",
      "IndentBlanklineIndent3",
      "IndentBlanklineIndent4"
    },
    space_char_highlight_list = {
      "IndentBlanklineIndent1",
      "IndentBlanklineIndent2",
      "IndentBlanklineIndent3",
      "IndentBlanklineIndent4"
    },
    show_trailing_blankline_indent = false
  }
  -- because lazy load indent-blankline so need readd this autocmd
  vim.cmd("autocmd CursorMoved * IndentBlanklineRefresh")
end

function config.gitsigns()
  if not packer_plugins['plenary.nvim'].loaded then
    vim.cmd([[packadd plenary.nvim]])
  end
  require('gitsigns').setup({
    signs = {
      add = { hl = 'GitGutterAdd', text = '▋' },
      change = { hl = 'GitGutterChange', text = '▋' },
      delete = { hl = 'GitGutterDelete', text = '▋' },
      topdelete = { hl = 'GitGutterDeleteChange', text = '▔' },
      changedelete = { hl = 'GitGutterChange', text = '▎' },
    },
    keymaps = {
      -- Default keymap options
      noremap = true,
      buffer = true,

      ['n ]g'] = { expr = true, "&diff ? ']g' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'" },
      ['n [g'] = { expr = true, "&diff ? '[g' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'" },

      ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
      ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
      ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
      ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
      ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',

      -- Text objects
      ['o ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>',
      ['x ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>',
    },
    current_line_blame = true
  })
end

function config.bufferline()
  require("bufferline").setup({
    options = {
      mode              = 'buffers',
      numbers           = 'ordinal',
      indicator         = {
        icon = '▌',
      },
      separator_style   = 'none',
      buffer_close_icon = '',
      offsets           = {
        { filetype = "NvimTree", text = "EXPLORER", text_align = "center" }
      }
    },
  })
end

return config
