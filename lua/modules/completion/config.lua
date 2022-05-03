local config = {}

function config.nvim_lsp()
    require("modules.completion.lspconfig")
end

function config.saga()
    vim.api.nvim_command("autocmd CursorHold * Lspsaga show_line_diagnostics")
end

function config.vsnip()
    vim.g.vsnip_snippet_dir = os.getenv("HOME") .. "/.config/nvim/snippets"
end

function config.compe()
    local cmp_kinds = {
        Text = " ",
        Method = "  ",
        Function = "  ",
        Constructor = "  ",
        Field = "  ",
        Variable = "  ",
        Class = "  ",
        Interface = "  ",
        Module = "  ",
        Property = "  ",
        Unit = "  ",
        Value = "  ",
        Enum = "  ",
        Keyword = "  ",
        Snippet = "  ",
        Color = "  ",
        File = "  ",
        Reference = "  ",
        Folder = "  ",
        EnumMember = "  ",
        Constant = "  ",
        Struct = "  ",
        Event = "  ",
        Operator = "  ",
        TypeParameter = "  "
    }

    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local feedkey = function(key, mode)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
    end

    local cmp = require("cmp")
    cmp.setup(
        {
            snippet = {
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                end
            },
            mapping = {
                ["<CR>"] = cmp.mapping.confirm({select = true}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ["<Tab>"] = cmp.mapping(
                    function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif vim.fn["vsnip#available"](1) == 1 then
                            feedkey("<Plug>(vsnip-expand-or-jump)", "")
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
                        end
                    end,
                    {"i", "s"}
                ),
                ["<S-Tab>"] = cmp.mapping(
                    function()
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                            feedkey("<Plug>(vsnip-jump-prev)", "")
                        end
                    end,
                    {"i", "s"}
                )
            },
            sources = cmp.config.sources(
                {
                    {name = "nvim_lsp"},
                    {name = "vsnip"}
                },
                {
                    {name = "buffer"},
                    {name = "path"},
                    {name = "nvim_lsp_signature_help"}
                }
            ),
            formatting = {
                format = function(_, vim_item)
                    vim_item.kind = (cmp_kinds[vim_item.kind] or "") .. vim_item.kind
                    return vim_item
                end
            }
        }
    )

    cmp.setup.filetype(
        "gitcommit",
        {
            sources = cmp.config.sources(
                {
                    {name = "cmp_git"}
                },
                {
                    {name = "buffer"}
                }
            )
        }
    )

    cmp.setup.cmdline(
        "/",
        {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                {name = "buffer"}
            }
        }
    )

    cmp.setup.cmdline(
        ":",
        {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources(
                {
                    {name = "path"}
                },
                {
                    {name = "cmdline"}
                }
            )
        }
    )
end

function config.autopairs()
    require("nvim-autopairs").setup(
        {
            disable_filetype = {"TelescopePrompt"},
            ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
            enable_moveright = true,
            enable_afterquote = true,
            enable_check_bracket_line = true,
            check_ts = true
        }
    )
end

function config.notify()
    vim.notify = require("notify")

    -- Utility functions shared between progress reports for LSP and DAP

    local client_notifs = {}

    local function get_notif_data(client_id, token)
        if not client_notifs[client_id] then
            client_notifs[client_id] = {}
        end

        if not client_notifs[client_id][token] then
            client_notifs[client_id][token] = {}
        end

        return client_notifs[client_id][token]
    end

    local spinner_frames = {"⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷"}

    local function update_spinner(client_id, token)
        local notif_data = get_notif_data(client_id, token)

        if notif_data.spinner then
            local new_spinner = (notif_data.spinner + 1) % #spinner_frames
            notif_data.spinner = new_spinner

            notif_data.notification =
                vim.notify(
                nil,
                nil,
                {
                    hide_from_history = true,
                    icon = spinner_frames[new_spinner],
                    replace = notif_data.notification
                }
            )

            vim.defer_fn(
                function()
                    update_spinner(client_id, token)
                end,
                100
            )
        end
    end

    local function format_title(title, client_name)
        return client_name .. (#title > 0 and ": " .. title or "")
    end

    local function format_message(message, percentage)
        return (percentage and percentage .. "%\t" or "") .. (message or "")
    end
    -- LSP integration
    -- Make sure to also have the snippet with the common helper functions in your config!

    vim.lsp.handlers["$/progress"] = function(_, result, ctx)
        local client_id = ctx.client_id

        local val = result.value

        if not val.kind then
            return
        end

        local notif_data = get_notif_data(client_id, result.token)

        if val.kind == "begin" then
            local message = format_message(val.message, val.percentage)

            notif_data.notification =
                vim.notify(
                message,
                "info",
                {
                    title = format_title(val.title, vim.lsp.get_client_by_id(client_id).name),
                    icon = spinner_frames[1],
                    timeout = false,
                    hide_from_history = false
                }
            )

            notif_data.spinner = 1
            update_spinner(client_id, result.token)
        elseif val.kind == "report" and notif_data then
            notif_data.notification =
                vim.notify(
                format_message(val.message, val.percentage),
                "info",
                {
                    replace = notif_data.notification,
                    hide_from_history = false
                }
            )
        elseif val.kind == "end" and notif_data then
            notif_data.notification =
                vim.notify(
                val.message and format_message(val.message) or "Complete",
                "info",
                {
                    icon = "",
                    replace = notif_data.notification,
                    timeout = 3000
                }
            )

            notif_data.spinner = nil
        end
    end
end

return config
