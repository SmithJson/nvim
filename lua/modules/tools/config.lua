local config = {}

function config.telescope()
    local home = os.getenv("HOME")

    if not packer_plugins["plenary.nvim"].loaded then
        vim.cmd [[packadd plenary.nvim]]
    end

    if not packer_plugins["popup.nvim"].loaded then
        vim.cmd [[packadd popup.nvim]]
    end

    if not packer_plugins["telescope-fzy-native.nvim"].loaded then
        vim.cmd [[packadd telescope-fzy-native.nvim]]
    end

    if not packer_plugins["telescope-project.nvim"].loaded then
        vim.cmd [[packadd telescope-project.nvim]]
    end

    if not packer_plugins["sql.nvim"].loaded then
        vim.cmd [[packadd sql.nvim]]
    end

    if not packer_plugins["telescope-frecency.nvim"].loaded then
        vim.cmd [[packadd telescope-frecency.nvim]]
    end

    require("telescope").setup {
        defaults = {
            prompt_prefix = "🔭 ",
            selection_caret = " ",
            layout_config = {
                horizontal = {prompt_position = "bottom", results_width = 0.6},
                vertical = {mirror = false}
            },
            file_previewer = require "telescope.previewers".vim_buffer_cat.new,
            grep_previewer = require "telescope.previewers".vim_buffer_vimgrep.new,
            qflist_previewer = require "telescope.previewers".vim_buffer_qflist.new,
            file_sorter = require("telescope.sorters").get_fuzzy_file,
            file_ignore_patterns = {},
            generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
            path_display = {"absolute"},
            winblend = 0,
            border = {},
            borderchars = {
                "─",
                "│",
                "─",
                "│",
                "╭",
                "╮",
                "╯",
                "╰"
            },
            color_devicons = true,
            use_less = true,
            set_env = {["COLORTERM"] = "truecolor"}
        },
        extensions = {
            fzy_native = {
                override_generic_sorter = false,
                override_file_sorter = true
            },
            frecency = {
                show_scores = true,
                show_unindexed = true,
                ignore_patterns = {"*.git/*", "*/tmp/*"},
                workspaces = {
                    ["conf"] = home .. "/.config",
                    ["data"] = home .. "/.local/share",
                    ["nvim"] = home .. "/.config/nvim"
                }
            }
        }
    }
    require("telescope").load_extension("fzy_native")
    require("telescope").load_extension("project")
    require("telescope").load_extension("frecency")
end

function config.symbols_outline()
    -- init.lua
    vim.g.symbols_outline = {
        highlight_hovered_item = true,
        show_guides = true,
        auto_preview = true,
        position = "right",
        width = 25,
        show_numbers = false,
        show_relative_numbers = false,
        show_symbol_details = true,
        preview_bg_highlight = "Pmenu",
        keymaps = {
            -- These keymaps can be a string or a table for multiple keys
            close = {"<Esc>", "q"},
            goto_location = "<Cr>",
            focus_location = "o",
            hover_symbol = "<C-space>",
            toggle_preview = "K",
            rename_symbol = "r",
            code_actions = "a"
        },
        lsp_blacklist = {},
        symbol_blacklist = {},
        symbols = {
            File = {icon = "", hl = "TSURI"},
            Module = {icon = "", hl = "TSNamespace"},
            Namespace = {icon = "", hl = "TSNamespace"},
            Package = {icon = "", hl = "TSNamespace"},
            Class = {icon = "𝓒", hl = "TSType"},
            Method = {icon = "ƒ", hl = "TSMethod"},
            Property = {icon = "", hl = "TSMethod"},
            Field = {icon = "", hl = "TSField"},
            Constructor = {icon = "", hl = "TSConstructor"},
            Enum = {icon = "ℰ", hl = "TSType"},
            Interface = {icon = "ﰮ", hl = "TSType"},
            Function = {icon = "", hl = "TSFunction"},
            Variable = {icon = "", hl = "TSConstant"},
            Constant = {icon = "", hl = "TSConstant"},
            String = {icon = "𝓐", hl = "TSString"},
            Number = {icon = "#", hl = "TSNumber"},
            Boolean = {icon = "⊨", hl = "TSBoolean"},
            Array = {icon = "", hl = "TSConstant"},
            Object = {icon = "⦿", hl = "TSType"},
            Key = {icon = "🔐", hl = "TSType"},
            Null = {icon = "NULL", hl = "TSType"},
            EnumMember = {icon = "", hl = "TSField"},
            Struct = {icon = "𝓢", hl = "TSType"},
            Event = {icon = "🗲", hl = "TSType"},
            Operator = {icon = "+", hl = "TSOperator"},
            TypeParameter = {icon = "𝙏", hl = "TSParameter"}
        }
    }
end

function config.todo_comments()
    local status_ok, todo_comments = pcall(require, "todo-comments")
    if not status_ok then
        return
    end

    local error_red = "#DB4B4B"
    local warning_orange = "#ff8800"
    local info_yellow = "#FFCC66"
    local hint_blue = "#4FC1FF"
    local perf_purple = "#BB9AF7"
    local note_green = "#10B981"

    todo_comments.setup(
        {
            signs = true, -- show icons in the signs column
            sign_priority = 8, -- sign priority
            -- keywords recognized as todo comments
            keywords = {
                FIX = {
                    icon = " ", -- icon used for the sign, and in search results
                    color = error_red, -- can be a hex color, or a named color (see below)
                    alt = {"FIXME", "BUG", "FIXIT", "ISSUE"} -- a set of other keywords that all map to this FIX keywords
                    -- signs = false, -- configure signs for some keywords individually
                },
                TODO = {icon = " ", color = hint_blue},
                HACK = {icon = " ", color = info_yellow},
                WARN = {icon = " ", color = warning_orange, alt = {"WARNING", "XXX"}},
                PERF = {icon = " ", color = perf_purple, alt = {"OPTIM", "PERFORMANCE", "OPTIMIZE"}},
                NOTE = {icon = " ", color = note_green, alt = {"INFO"}}
            },
            highlight = {
                before = "", -- "fg" or "bg" or empty
                keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
                after = "fg", -- "fg" or "bg" or empty
                pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
                comments_only = true, -- uses treesitter to match keywords in comments only
                max_line_len = 400, -- ignore lines longer than this
                exclude = {} -- list of file types to exclude highlighting
            },
            search = {
                command = "rg",
                args = {
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column"
                },
                pattern = [[\b(KEYWORDS):]] -- ripgrep regex
            }
        }
    )
end

function config.toggleterm()
    require("toggleterm").setup(
        {
            -- size can be a number or function which is passed the current terminal
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.40
                end
            end,
            open_mapping = [[<c-\>]],
            hide_numbers = true, -- hide the number column in toggleterm buffers
            shade_filetypes = {},
            shade_terminals = false,
            shading_factor = "1", -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
            start_in_insert = true,
            insert_mappings = true, -- whether or not the open mapping applies in insert mode
            persist_size = true,
            direction = "horizontal",
            close_on_exit = true, -- close the terminal window when the process exits
            shell = vim.o.shell -- change the default shell
        }
    )
end

function config.session()
    if not packer_plugins["plenary.nvim"].loaded then
        vim.cmd [[packadd plenary.nvim]]
    end
    local Path = require("plenary.path")
    require("session_manager").setup(
        {
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
        }
    )
end

return config
