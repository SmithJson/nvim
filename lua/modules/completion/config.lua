local config = {}

function config.nvim_lsp()
    require('modules.completion.lspconfig')
end

function config.lspsaga()
    require('lspsaga').setup({})
end

function config.nvim_cmp()
    local border_opts = { border = "single", winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None" }
    local symbol_map = {
        Text          = "",
        Method        = "",
        Function      = "",
        Field         = "",
        Variable      = "",
        Interface     = "",
        Module        = "",
        Value         = "",
        Enum          = "了",
        Keyword       = "",
        Color         = "",
        File          = "",
        Folder        = "",
        EnumMember    = "",
        Constant      = "",
        Struct        = "",
        Event         = "",
        Operator      = "",
        Array = "",
        Boolean = "",
        Class = "",
        Constructor = "",
        Key = "",
        Namespace = "",
        Null = "",
        Number = "",
        Object = "",
        Package = "",
        Property = "",
        Reference = "",
        Snippet = "",
        String = "𝓐",
        TypeParameter = "",
        Unit = "",
    }
    local cmp = require('cmp')

    cmp.setup({
        preselect = cmp.PreselectMode.None,
        window = {
            completion = cmp.config.window.bordered(border_opts),
            documentation = cmp.config.window.bordered(border_opts),
        },
        formatting = {
            format = function(entry, vim_item)
                print(entry.source.name);
                vim_item.kind = string.format("%s %s", symbol_map[vim_item.kind], vim_item.kind)
                vim_item.menu = ({
                    buffer   = "[BUF]",
                    nvim_lsp = "[LSP]",
                    vsnip  = "[VSP]",
                    cmdline = "[CMD]"
                })[entry.source.name]
                return vim_item
            end,
        },
        -- You can set mappings if you want
        mapping = cmp.mapping.preset.insert({
            ['<C-e>'] = cmp.config.disable,
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ["<CR>"] = cmp.mapping.confirm({
                select = true
            }),
            ["<S-Tab>"] = cmp.mapping.select_prev_item(),
            ["<Tab>"] = cmp.mapping.select_next_item()
        }),
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end
        },
        sources = {
            { name = 'nvim_lsp' },
            { name = 'vsnip' },
            { name = 'buffer' },
            { name = 'path' }
        }
    })

    cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(
            { { name = "buffer" } },
            { { name = "cmdline" } }
        )
    })
    cmp.setup.cmdline("?", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(
            { { name = "buffer" } },
            { { name = "cmdline" } }
        )
    })
    cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(
            { { name = "path" } },
            { { name = "cmdline" } }
        )
    })
end

function config.auto_pairs()
    require('nvim-autopairs').setup({})
    local status, cmp = pcall(require, 'cmp')
    if not status then
        vim.cmd([[packadd nvim-cmp]])
        cmp = require('cmp')
    end
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({
        map_char = {
            tex = ''
        }
    }))
end

function config.vsnip()
    if not packer_plugins["vim-vsnip"].loaded then
        vim.cmd [[packadd vim-vsnip]]
    end
    vim.g.vsnip_snippet_dir = os.getenv("HOME") .. "/.config/nvim/snippets"
end

return config
