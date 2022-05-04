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
    require "nvim-tree".setup {
        disable_netrw = true,
        hijack_netrw = true,
        open_on_setup = false,
        ignore_ft_on_setup = {},
        open_on_tab = false,
        hijack_cursor = false,
        update_cwd = true,
        update_focused_file = {
            enable = true,
            update_cwd = true,
            ignore_list = {}
        },
        system_open = {
            cmd = nil,
            args = {}
        },
        renderer = {
            indent_markers = {
                enable = true
            }
        },
        view = {
            width = 30,
            side = "left",
            mappings = {
                custom_only = false,
                list = {}
            }
        }
    }

    -- vim.g.nvim_tree_hide_dotfiles = 1
    -- vim.g.nvim_tree_indent_markers = 1
    -- vim.g.nvim_tree_indent_markers = 1
    vim.g.nvim_tree_icons = {
        default = "",
        symlink = "",
        git = {
            unstaged = "✗",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "★",
            deleted = "",
            ignored = "◌"
        },
        folder = {
            arrow_open = "",
            arrow_closed = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = ""
        }
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

function config.cokeline()
    if not packer_plugins["nvim-cokeline"].loaded then
        vim.cmd [[packadd nvim-cokeline]]
    end
    local map = vim.api.nvim_set_keymap

    map('n', '<S-Tab>',   '<Plug>(cokeline-focus-prev)',  { silent = true })
    map('n', '<Tab>',     '<Plug>(cokeline-focus-next)',  { silent = true })
    map('n', '<Leader>p', '<Plug>(cokeline-switch-prev)', { silent = true })
    map('n', '<Leader>n', '<Plug>(cokeline-switch-next)', { silent = true })
    for i = 1,9 do
        -- map('n', ('<F%s>'):format(i),      ('<Plug>(cokeline-focus-%s)'):format(i),  { silent = true })
        map('n', ('<Leader>%s'):format(i),      ('<Plug>(cokeline-focus-%s)'):format(i),  { silent = true })
        -- map('n', ('<Leader>%s'):format(i), ('<Plug>(cokeline-switch-%s)'):format(i), { silent = true })
    end

    local get_hex = require('cokeline/utils').get_hex
    local mappings = require('cokeline/mappings')

    local comments_fg = get_hex('Comment', 'fg')
    local errors_fg = get_hex('DiagnosticError', 'fg')
    local warnings_fg = get_hex('DiagnosticWarn', 'fg')

    local red = vim.g.terminal_color_1
    local yellow = vim.g.terminal_color_3

    local components = {
        space = {
            text = ' ',
            truncation = { priority = 1 }
        },

        two_spaces = {
            text = '  ',
            truncation = { priority = 1 },
        },

        separator = {
            text = function(buffer)
                return buffer.index ~= 1 and '▏' or ''
            end,
            truncation = { priority = 1 }
        },

        devicon = {
            text = function(buffer)
                return
                (mappings.is_picking_focus() or mappings.is_picking_close())
                and buffer.pick_letter .. ' '
                or buffer.devicon.icon
            end,
            fg = function(buffer)
                return
                (mappings.is_picking_focus() and yellow)
                or (mappings.is_picking_close() and red)
                or buffer.devicon.color
            end,
            style = function(_)
                return
                (mappings.is_picking_focus() or mappings.is_picking_close())
                and 'italic,bold'
                or nil
            end,
            truncation = { priority = 1 }
        },

        index = {
            text = function(buffer)
                return buffer.index .. ': '
            end,
            truncation = { priority = 1 }
        },

        unique_prefix = {
            text = function(buffer)
                return buffer.unique_prefix
            end,
            fg = comments_fg,
            style = 'italic',
            truncation = {
                priority = 3,
                direction = 'left',
            },
        },

        filename = {
            text = function(buffer)
                return buffer.filename
            end,
            style = function(buffer)
                return
                ((buffer.is_focused and buffer.diagnostics.errors ~= 0)
                and 'bold,underline')
                or (buffer.is_focused and 'bold')
                or (buffer.diagnostics.errors ~= 0 and 'underline')
                or nil
            end,
            truncation = {
                priority = 2,
                direction = 'left',
            },
        },

        diagnostics = {
            text = function(buffer)
                return
                (buffer.diagnostics.errors ~= 0 and '  ' .. buffer.diagnostics.errors)
                or (buffer.diagnostics.warnings ~= 0 and '  ' .. buffer.diagnostics.warnings)
                or ''
            end,
            fg = function(buffer)
                return
                (buffer.diagnostics.errors ~= 0 and errors_fg)
                or (buffer.diagnostics.warnings ~= 0 and warnings_fg)
                or nil
            end,
            truncation = { priority = 1 },
        },

        close_or_unsaved = {
            text = function(buffer)
                return buffer.is_modified and '●' or ''
            end,
            fg = function(buffer)
                return buffer.is_modified and green or nil
            end,
            delete_buffer_on_left_click = true,
            truncation = { priority = 1 },
        },
    }

    require('cokeline').setup({
        show_if_buffers_are_at_least = 2,

        buffers = {
            -- filter_valid = function(buffer) return buffer.type ~= 'terminal' end,
            -- filter_visible = function(buffer) return buffer.type ~= 'terminal' end,
            new_buffers_position = 'next',
        },

        rendering = {
            max_buffer_width = 30,
        },

        default_hl = {
            fg = function(buffer)
                return
                buffer.is_focused
                and get_hex('Normal', 'fg')
                or get_hex('Comment', 'fg')
            end,
            bg = get_hex('ColorColumn', 'bg'),
        },

        components = {
            components.space,
            components.separator,
            components.space,
            components.devicon,
            components.space,
            components.index,
            components.unique_prefix,
            components.filename,
            components.diagnostics,
            components.two_spaces,
            components.close_or_unsaved,
            components.space,
        },
    })
end

function config.rooter()
    vim.g.rooter_patterns = {"node_modules", "__vim_project_root", ".git/"}
    vim.g.rooter_silent_chdir = 1
    vim.g.rooter_cd_cmd = "lcd"
end

function config.dashboard()
    vim.g.dashboard_footer_icon = "🐬 "
    vim.g.dashboard_default_executive = "telescope"
    vim.g.dashboard_footer_icon = "🦸 "
    vim.g.dashboard_custom_header = {
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

function config.bubbly()
    vim.g.bubbly_tabline = 0
    vim.g.bubbly_palette = {
        background = "#34343c",
        foreground = "#c5cdd9",
        black = "#3e4249",
        red = "#ec7279",
        green = "#a0c980",
        yellow = "#deb974",
        blue = "#6cb6eb",
        purple = "#d38aea",
        cyan = "#5dbbc1",
        white = "#c5cdd9",
        lightgrey = "#57595e",
        darkgrey = "#404247"
    }
    vim.g.bubbly_statusline = {
        "mode",
        "truncate",
        "filetype",
        "divisor",
        "path",
        "divisor",
        "branch",
        "gitsigns",
        "progress"
    }
end

return config
