local config = {}

function config.galaxyline()
    require('modules.ui.eviline')
end

function config.dashboard()
    local db = require('dashboard')
    local z = {
      red = "#e95678",
      redwine = "#d16d9e",
      orange = "#FF8700",
      yellow = "#f7bb3b",
      green = "#afd700",
      dark_green = "#98be65",
      cyan = "#36d0e0",
      blue = "#61afef",
      violet = "#CBA6F7",
      magenta = "#c678dd",
      teal = "#1abc9c",
      grey = "#928374",
      brown = "#c78665",
      black = "#000000"
    }    
    db.custom_center = {
      {
        icon = '  ',
        icon_hl = { fg = z.red },
        desc = 'Update Plugins                          ',
        shortcut = 'SPC p u',
        action = 'PackerUpdate',
      },
      {
        icon = '  ',
        icon_hl = { fg = z.yellow },
        desc = 'Recently opened files                   ',
        action = 'Telescope oldfiles',
        shortcut = 'SPC f h',
      },
      {
        icon = '  ',
        icon_hl = { fg = z.cyan },
        desc = 'Find  File                              ',
        action = 'Telescope find_files find_command=rg,--hidden,--files',
        shortcut = 'SPC f f',
      },
      {
        icon = '  ',
        icon_hl = { fg = z.blue },
        desc = 'File Browser                            ',
        action = 'Telescope file_browser',
        shortcut = 'SPC f b',
      },
      {
        icon = '  ',
        icon_hl = { fg = z.oragne },
        desc = 'Find  word                              ',
        action = 'Telescope live_grep',
        shortcut = 'SPC f w',
      },
      {
        icon = '  ',
        icon_hl = { fg = z.redwine },
        desc = 'Open Personal dotfiles                  ',
        action = 'Telescope dotfiles path=' .. vim.env.HOME .. '/.dotfiles',
        shortcut = 'SPC f d',
      },
    }
    db.custom_header = {
      "",
      "",
      "███████╗██╗   ██╗ █████╗     ██╗     ██╗██╗     ██╗████████╗██╗  ██╗",
      "██╔════╝██║   ██║██╔══██╗    ██║     ██║██║     ██║╚══██╔══╝██║  ██║",
      "█████╗  ██║   ██║███████║    ██║     ██║██║     ██║   ██║   ███████║",
      "██╔══╝  ╚██╗ ██╔╝██╔══██║    ██║     ██║██║     ██║   ██║   ██╔══██║",
      "███████╗ ╚████╔╝ ██║  ██║    ███████╗██║███████╗██║   ██║   ██║  ██║",
      "╚══════╝  ╚═══╝  ╚═╝  ╚═╝    ╚══════╝╚═╝╚══════╝╚═╝   ╚═╝   ╚═╝  ╚═╝",
      "",
      "[  辩机 ]     "
    }
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
        "json",
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
    vim.g.indent_blankline_buftype_exclude = {"terminal", "nofile"}
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

function config.barbar()
  vim.g.bufferline = {
      -- Enable/disable animations
      animation = true,

      -- Enable/disable auto-hiding the tab bar when there is a single buffer
      auto_hide = false,

      -- Enable/disable current/total tabpages indicator (top right corner)
      tabpages = true,

      -- Enable/disable close button
      closable = false,

      -- Enables/disable clickable tabs
      --  - left-click: go to buffer
      --  - middle-click: delete buffer
      clickable = true,

      -- Excludes buffers from the tabline
      -- exclude_ft = {'javascript'},
      -- exclude_name = {'package.json'},

      -- Enable/disable icons
      -- if set to 'numbers', will show buffer index in the tabline
      -- if set to 'both', will show buffer index and icons in the tabline
      icons = 'both',

      -- If set, the icon color will follow its corresponding buffer
      -- highlight group. By default, the Buffer*Icon group is linked to the
      -- Buffer* group (see Highlighting below). Otherwise, it will take its
      -- default value as defined by devicons.
      icon_custom_colors = false,

      -- Configure icons on the bufferline.
      icon_separator_active = '▎',
      icon_separator_inactive = '▎',
      icon_close_tab = '',
      icon_close_tab_modified = '●',
      icon_pinned = '車',

      -- If true, new buffers will be inserted at the start/end of the list.
      -- Default is to insert after current buffer.
      insert_at_end = false,
      insert_at_start = false,

      -- Sets the maximum padding width with which to surround each tab
      maximum_padding = 1,

      -- Sets the maximum buffer name length.
      maximum_length = 30,

      -- If set, the letters for each buffer in buffer-pick mode will be
      -- assigned based on their name. Otherwise or in case all letters are
      -- already assigned, the behavior is to assign letters in order of
      -- usability (see order below)
      semantic_letters = true,

      -- New buffer letters are assigned in this order. This order is
      -- optimal for the qwerty keyboard layout but might need adjustement
      -- for other layouts.
      letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

      -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
      -- where X is the buffer number. But only a static string is accepted here.
      no_name_title = nil,
  }
end

return config