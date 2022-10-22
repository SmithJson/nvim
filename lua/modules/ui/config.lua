local config = {}

function config.gitsigns()
    if not packer_plugins["plenary.nvim"].loaded then
        vim.cmd [[packadd plenary.nvim]]
    end

    require("gitsigns").setup {
        signs = {
            add = {
                hl = "GitGutterAdd",
                text = "▋"
            },
            change = {
                hl = "GitGutterChange",
                text = "▋"
            },
            delete = {
                hl = "GitGutterDelete",
                text = "▋"
            },
            topdelete = {
                hl = "GitGutterDeleteChange",
                text = "▔"
            },
            changedelete = {
                hl = "GitGutterChange",
                text = "▎"
            }
        },
        keymaps = {
            -- Default keymap options
            noremap = true,
            buffer = true,
            ["n ]g"] = {
                expr = true,
                '&diff ? \']g\' : \'<cmd>lua require"gitsigns".next_hunk()<CR>\''
            },
            ["n [g"] = {
                expr = true,
                '&diff ? \'[g\' : \'<cmd>lua require"gitsigns".prev_hunk()<CR>\''
            },
            ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
            ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
            ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
            ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
            ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line()<CR>',
            -- Text objects
            ["o ih"] = ':<C-U>lua require"gitsigns".text_object()<CR>',
            ["x ih"] = ':<C-U>lua require"gitsigns".text_object()<CR>'
        },
        current_line_blame = true
    }
end

-- discard()
function config.nvim_tree()
    -- On Ready Event for Lazy Loading work
    if not packer_plugins["nvim-tree.lua"].loaded then
        vim.cmd [[packadd nvim-tree.lua]]
    end

    require'nvim-tree'.setup { -- BEGIN_DEFAULT_OPTS
    auto_reload_on_write = true,
    disable_netrw = false,
    hijack_cursor = false,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    ignore_buffer_on_setup = false,
    open_on_setup = false,
    open_on_setup_file = false,
    open_on_tab = false,
    sort_by = "name",
    update_cwd = false,
    view = {
        width = 30,
        hide_root_folder = false,
        side = "left",
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
        mappings = {
            custom_only = false,
            list = {
                -- user mappings go here
            },
        },
    },
    renderer = {
        indent_markers = {
            enable = false,
            icons = {
                corner = "└ ",
                edge = "│ ",
                none = "  ",
            },
        },
        icons = {
            webdev_colors = true,
        },
    },
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    update_focused_file = {
        enable = false,
        update_cwd = false,
        ignore_list = {},
    },
    ignore_ft_on_setup = {},
    system_open = {
        cmd = "",
        args = {},
    },
    diagnostics = {
        enable = false,
        show_on_dirs = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    filters = {
        dotfiles = false,
        custom = {},
        exclude = {},
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 400,
    },
    actions = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = false,
            restrict_above_cwd = false,
        },
        open_file = {
            quit_on_open = false,
            resize_window = false,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                    buftype = { "nofile", "terminal", "help" },
                },
            },
        },
    },
    trash = {
        cmd = "trash",
        require_confirm = true,
    },
    log = {
        enable = false,
        truncate = false,
        types = {
            all = false,
            config = false,
            copy_paste = false,
            diagnostics = false,
            git = false,
            profile = false,
        },
    },
}
end

function config.indent_blakline()
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

function config.rooter()
    vim.g.rooter_patterns = {"node_modules", "__vim_project_root", ".git/"}
    vim.g.rooter_silent_chdir = 1
    vim.g.rooter_cd_cmd = "lcd"
end

function config.dashboard()
  local home = os.getenv('HOME')
  local db = require('dashboard')
  -- macos
  --[[ db.preview_command = 'cat | lolcat -F 0.3' ]]
  --[[ db.preview_file_path = home .. '/.config/nvim/static/neovim.cat' ]]
  --[[ db.preview_file_height = 11 ]]
  --[[ db.preview_file_width = 70 ]]
  db.custom_center = {
      {icon = '  ',
      desc = 'Recently latest session                  ',
      shortcut = 'SPC s l',
      action ='SessionLoad'},
      {icon = '  ',
      desc = 'Recently opened files                   ',
      action =  'Telescope search_history',
      shortcut = 'SPC f h'},
      {icon = '  ',
      desc = 'Find  File                              ',
      action = 'Telescope find_files find_command=rg,--hidden,--files',
      shortcut = 'SPC f f'},
      {icon = '  ',
      desc ='File Browser                            ',
      action =  'Telescope file_browser',
      shortcut = 'SPC f b'},
      {icon = '  ',
      desc = 'Find  word                              ',
      action = 'Telescope live_grep',
      shortcut = 'SPC f w'},
      {icon = '  ',
      desc = 'Open Personal dotfiles                  ',
      action = 'Telescope dotfiles path=' .. home ..'/.dotfiles',
      shortcut = 'SPC f d'},
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
        "                           [  辩机 ]     "
    }
end

function config.windline()
    require('wlsample.vscode')
end

function config.diffview()
    -- Lua
    local cb = require "diffview.config".diffview_callback

    require "diffview".setup {
        diff_binaries = false, -- Show diffs for binaries
        enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
        use_icons = true, -- Requires nvim-web-devicons
        icons = {
            -- Only applies when use_icons is true.
            folder_closed = "",
            folder_open = ""
        },
        signs = {
            fold_closed = "",
            fold_open = ""
        },
        file_panel = {
            position = "left", -- One of 'left', 'right', 'top', 'bottom'
            width = 35, -- Only applies when position is 'left' or 'right'
            height = 10, -- Only applies when position is 'top' or 'bottom'
            listing_style = "tree", -- One of 'list' or 'tree'
            tree_options = {
                -- Only applies when listing_style is 'tree'
                flatten_dirs = true, -- Flatten dirs that only contain one single dir
                folder_statuses = "only_folded" -- One of 'never', 'only_folded' or 'always'.
            }
        },
        file_history_panel = {
            position = "bottom",
            width = 35,
            height = 16,
            log_options = {
                max_count = 256, -- Limit the number of commits
                follow = false, -- Follow renames (only for single file)
                all = false, -- Include all refs under 'refs/' including HEAD
                merges = false, -- List only merge commits
                no_merges = false, -- List no merge commits
                reverse = false -- List commits in reverse order
            }
        },
        default_args = {
            -- Default args prepended to the arg-list for the listed commands
            DiffviewOpen = {},
            DiffviewFileHistory = {}
        },
        hooks = {}, -- See ':h diffview-config-hooks'
        key_bindings = {
            disable_defaults = false, -- Disable the default key bindings
            -- The `view` bindings are active in the diff buffers, only when the current
            -- tabpage is a Diffview.
            view = {
                ["<tab>"] = cb("select_next_entry"), -- Open the diff for the next file
                ["<s-tab>"] = cb("select_prev_entry"), -- Open the diff for the previous file
                ["gf"] = cb("goto_file"), -- Open the file in a new split in previous tabpage
                ["<C-w><C-f>"] = cb("goto_file_split"), -- Open the file in a new split
                ["<C-w>gf"] = cb("goto_file_tab"), -- Open the file in a new tabpage
                ["<leader>e"] = cb("focus_files"), -- Bring focus to the files panel
                ["<leader>b"] = cb("toggle_files") -- Toggle the files panel.
            },
            file_panel = {
                ["j"] = cb("next_entry"), -- Bring the cursor to the next file entry
                ["<down>"] = cb("next_entry"),
                ["k"] = cb("prev_entry"), -- Bring the cursor to the previous file entry.
                ["<up>"] = cb("prev_entry"),
                ["<cr>"] = cb("select_entry"), -- Open the diff for the selected entry.
                ["o"] = cb("select_entry"),
                ["<2-LeftMouse>"] = cb("select_entry"),
                ["-"] = cb("toggle_stage_entry"), -- Stage / unstage the selected entry.
                ["S"] = cb("stage_all"), -- Stage all entries.
                ["U"] = cb("unstage_all"), -- Unstage all entries.
                ["X"] = cb("restore_entry"), -- Restore entry to the state on the left side.
                ["R"] = cb("refresh_files"), -- Update stats and entries in the file list.
                ["<tab>"] = cb("select_next_entry"),
                ["<s-tab>"] = cb("select_prev_entry"),
                ["gf"] = cb("goto_file"),
                ["<C-w><C-f>"] = cb("goto_file_split"),
                ["<C-w>gf"] = cb("goto_file_tab"),
                ["i"] = cb("listing_style"), -- Toggle between 'list' and 'tree' views
                ["f"] = cb("toggle_flatten_dirs"), -- Flatten empty subdirectories in tree listing style.
                ["<leader>e"] = cb("focus_files"),
                ["<leader>b"] = cb("toggle_files")
            },
            file_history_panel = {
                ["g!"] = cb("options"), -- Open the option panel
                ["<C-A-d>"] = cb("open_in_diffview"), -- Open the entry under the cursor in a diffview
                ["y"] = cb("copy_hash"), -- Copy the commit hash of the entry under the cursor
                ["zR"] = cb("open_all_folds"),
                ["zM"] = cb("close_all_folds"),
                ["j"] = cb("next_entry"),
                ["<down>"] = cb("next_entry"),
                ["k"] = cb("prev_entry"),
                ["<up>"] = cb("prev_entry"),
                ["<cr>"] = cb("select_entry"),
                ["o"] = cb("select_entry"),
                ["<2-LeftMouse>"] = cb("select_entry"),
                ["<tab>"] = cb("select_next_entry"),
                ["<s-tab>"] = cb("select_prev_entry"),
                ["gf"] = cb("goto_file"),
                ["<C-w><C-f>"] = cb("goto_file_split"),
                ["<C-w>gf"] = cb("goto_file_tab"),
                ["<leader>e"] = cb("focus_files"),
                ["<leader>b"] = cb("toggle_files")
            },
            option_panel = {
                ["<tab>"] = cb("select"),
                ["q"] = cb("close")
            }
        }
    }
end

function config.barbar()
    if not packer_plugins["barbar.nvim"].loaded then
        vim.cmd [[packadd barbar.nvim]]
    end
    -- Set barbar's options
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
