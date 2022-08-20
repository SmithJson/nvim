local config = {}

function config.nvim_lsp()
    require("modules.completion.lspconfig")
end

function config.saga()
    vim.api.nvim_command("autocmd CursorHold * Lspsaga show_line_diagnostics")
end

function config.vsnip()
    if not packer_plugins["vim-vsnip"].loaded then
        vim.cmd [[packadd vim-vsnip]]
    end
    vim.g.vsnip_snippet_dir = os.getenv("HOME") .. "/.config/nvim/snippets"
end

function config.compe()
    if not packer_plugins["nvim-cmp"].loaded then
        vim.cmd [[packadd nvim-cmp]]
    end
    if not packer_plugins["cmp-nvim-lsp"].loaded then
        vim.cmd [[packadd cmp-nvim-lsp]]
    end
    if not packer_plugins["cmp-buffer"].loaded then
        vim.cmd [[packadd cmp-buffer]]
    end
    if not packer_plugins["cmp-path"].loaded then
        vim.cmd [[packadd cmp-path]]
    end
    if not packer_plugins["cmp-vsnip"].loaded then
        vim.cmd [[packadd cmp-vsnip]]
    end
    if not packer_plugins["cmp-nvim-lsp-signature-help"].loaded then
        vim.cmd [[packadd cmp-nvim-lsp-signature-help]]
    end
    if not packer_plugins["lspkind-nvim"].loaded then
        vim.cmd [[packadd lspkind-nvim]]
    end

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
                ["<CR>"] = cmp.mapping.confirm({select = true}),
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
                    {"i", "s", "c"}
                ),
                ["<S-Tab>"] = cmp.mapping(
                    function()
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                            feedkey("<Plug>(vsnip-jump-prev)", "")
                        end
                    end,
                    {"i", "s", "c"}
                )
            },
            sources = cmp.config.sources(
                {
                    {name = "nvim_lsp"},
                    {name = "buffer"},
                    {name = "path"},
                    {name = "vsnip"},
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
        "?",
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

return config
