local config = {}

function config.gitsigns()
    if not packer_plugins['plenary.nvim'].loaded then
        vim.cmd [[packadd plenary.nvim]]
    end

    require('gitsigns').setup {
        signs = {
            add = {
                hl = 'GitGutterAdd',
                text = '▋'
            },
            change = {
                hl = 'GitGutterChange',
                text = '▋'
            },
            delete = {
                hl = 'GitGutterDelete',
                text = '▋'
            },
            topdelete = {
                hl = 'GitGutterDeleteChange',
                text = '▔'
            },
            changedelete = {
                hl = 'GitGutterChange',
                text = '▎'
            }
        },
        keymaps = {
            -- Default keymap options
            noremap = true,
            buffer = true,

            ['n ]g'] = {
                expr = true,
                "&diff ? ']g' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"
            },
            ['n [g'] = {
                expr = true,
                "&diff ? '[g' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"
            },

            ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
            ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
            ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
            ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
            ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',

            -- Text objects
            ['o ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>',
            ['x ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>'
        },
        current_line_blame = true
    }

end

function config.nvim_tree()
    -- On Ready Event for Lazy Loading work
    require("nvim-tree.events").on_nvim_tree_ready(
    function()
        vim.cmd("NvimTreeRefresh")
    end
    )
    require'nvim-tree'.setup {
        disable_netrw       = true,
        hijack_netrw        = true,
        open_on_setup       = false,
        ignore_ft_on_setup  = {},
        auto_close          = true,
        open_on_tab         = false,
        hijack_cursor       = false,
        update_cwd          = true,
        lsp_diagnostics     = false,
        update_focused_file = {
            enable      = true,
            update_cwd  = true,
            ignore_list = {}
        },
        system_open = {
            cmd  = nil,
            args = {}
        },
        view = {
            width = 30,
            side = 'left',
            auto_resize = false,
            mappings = {
                custom_only = false,
                list = {}
            }
        }
    }

    vim.g.nvim_tree_hide_dotfiles = 1
    vim.g.nvim_tree_indent_markers = 1
    vim.g.nvim_tree_icons = {
        default =  '',
        symlink =  '',
        git = {
            unstaged = "✚",
            staged =  "✚",
            unmerged =  "≠",
            renamed =  "≫",
            untracked = "★",
        },
    }
end

function config.indent_blakline()
    vim.g.indent_blankline_char = "│"
    vim.g.indent_blankline_show_first_indent_level = true
    vim.g.indent_blankline_filetype_exclude = {
        "startify", "dashboard", "dotooagenda", "log", "fugitive", "gitcommit",
        "packer", "vimwiki", "markdown", "json", "txt", "vista", "help",
        "todoist", "NvimTree", "peekaboo", "git", "TelescopePrompt", "undotree",
        "flutterToolsOutline", "" -- for all buffers without a file type
    }
    vim.g.indent_blankline_buftype_exclude = {"terminal", "nofile"}
    vim.g.indent_blankline_show_trailing_blankline_indent = false
    vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
    require("indent_blankline").setup {
        space_char_blankline = " ",
        char_highlight_list = {
            "IndentBlanklineIndent1",
            "IndentBlanklineIndent2",
            "IndentBlanklineIndent3",
            "IndentBlanklineIndent4",
            "IndentBlanklineIndent5",
            "IndentBlanklineIndent6",
        },
    }
    -- because lazy load indent-blankline so need readd this autocmd
    vim.cmd('autocmd CursorMoved * IndentBlanklineRefresh')
end

function config.nvim_bufferline()
    require("bufferline").setup{
        options = {
            separator_style = "slant",
            show_close_icon = false,
            custom_areas = {
                right = function()
                    local result = {}
                    local error = vim.lsp.diagnostic.get_count(0, [[Error]])
                    local warning = vim.lsp.diagnostic.get_count(0, [[Warning]])
                    local info = vim.lsp.diagnostic.get_count(0, [[Information]])
                    local hint = vim.lsp.diagnostic.get_count(0, [[Hint]])

                    if error ~= 0 then
                        table.insert(result, {text = "  " .. error, guifg = "#EC5241"})
                    end

                    if warning ~= 0 then
                        table.insert(result, {text = "  " .. warning, guifg = "#EFB839"})
                    end

                    if hint ~= 0 then
                        table.insert(result, {text = "  " .. hint, guifg = "#A3BA5E"})
                    end

                    if info ~= 0 then
                        table.insert(result, {text = "  " .. info, guifg = "#7EA9A7"})
                    end
                    return result
                end,
            }
        }
    }
end

function config.galaxyline()
    require('modules.ui.eviline')
end

function config.dashboard()
    vim.g.dashboard_footer_icon = '🐬 '
    vim.g.dashboard_default_executive ='telescope'
    vim.g.dashboard_footer_icon = '🦸 '
    vim.g.dashboard_custom_header = {
        '',
        '',
        '███████╗██╗   ██╗ █████╗     ██╗     ██╗██╗     ██╗████████╗██╗  ██╗',
        '██╔════╝██║   ██║██╔══██╗    ██║     ██║██║     ██║╚══██╔══╝██║  ██║',
        '█████╗  ██║   ██║███████║    ██║     ██║██║     ██║   ██║   ███████║',
        '██╔══╝  ╚██╗ ██╔╝██╔══██║    ██║     ██║██║     ██║   ██║   ██╔══██║',
        '███████╗ ╚████╔╝ ██║  ██║    ███████╗██║███████╗██║   ██║   ██║  ██║',
        '╚══════╝  ╚═══╝  ╚═╝  ╚═╝    ╚══════╝╚═╝╚══════╝╚═╝   ╚═╝   ╚═╝  ╚═╝',
        '',
        '                           [  辩机 ]     ',
    }
end

return config
