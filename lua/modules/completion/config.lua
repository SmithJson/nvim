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
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered()
            },
            mapping = {
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ["<CR>"] = cmp.mapping.confirm({select = true}),
                ["<Tab>"] = cmp.mapping(
                    function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif vim.fn["vsnip#available"](1) == 1 then
                            feedkey("<Plug>(vsnip-expand-or-jump)", "")
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
                        else
                            fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
                        end
                    end,
                    {"i", "s"}
                )
            },
            sources = cmp.config.sources(
                {
                    {name = "nvim_lsp"},
                    {name = "vsnip"},
                    {name = "nvim_lsp_signature_help"},
                    {name = "buffer"},
                    {name = "path"}
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
