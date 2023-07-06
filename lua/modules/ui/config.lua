local config = {}

function config.dashboard()
    local db = require('dashboard')
    db.setup({
        theme = 'hyper',
        disable_move = true,
        config = {
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

function config.gitsigns()
    require('gitsigns').setup({
        signs = {
            add = { hl = 'GitGutterAdd', text = '▋' },
            change = { hl = 'GitGutterChange', text = '▋' },
            delete = { hl = 'GitGutterDelete', text = '▋' },
            topdelete = { hl = 'GitGutterDeleteChange', text = '▔' },
            changedelete = { hl = 'GitGutterChange', text = '▎' },
        },
        -- keymaps = {
        --     -- Default keymap options
        --     noremap = true,
        --     buffer = true,
        --     ['n ]g'] = { expr = true, "&diff ? ']g' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'" },
        --     ['n [g'] = { expr = true, "&diff ? '[g' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'" },
        --     ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
        --     ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
        --     ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
        --     ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
        --     ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',
        --     -- Text objects
        --     ['o ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>',
        --     ['x ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>',
        -- },
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
            offsets           = {
                { filetype = "NvimTree", text = "EXPLORER", text_align = "center" }
            }
        },
    })
end

function config.galaxyline()
    require('modules.ui.eviline')
end

function config.indent_blankline()
    vim.g.indent_blankline_filetype_exclude = {'dashboard'}
    vim.opt.list = true
    vim.opt.listchars:append "space:⋅"
    vim.opt.listchars:append "eol:↴"

    require("indent_blankline").setup {
        space_char_blankline = " ",
        show_end_of_lien = true
    }
end

return config
