local config = {}

function config.lspconfig()
    require('modules.completion.lsp')
end

function config.nvim_cmp()
    local border_opts = {
        border = "single",
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None"
    }
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
        Array         = "",
        Boolean       = "",
        Class         = "",
        Constructor   = "",
        Key           = "",
        Namespace     = "",
        Null          = "",
        Number        = "",
        Object        = "",
        Package       = "",
        Property      = "",
        Reference     = "",
        Snippet       = "",
        String        = "𝓐",
        TypeParameter = "",
        Unit          = "",
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
                vim_item.kind = string.format("%s %s", symbol_map[vim_item.kind], vim_item.kind)
                vim_item.menu = ({
                    buffer   = "[BUF]",
                    nvim_lsp = "[LSP]",
                    luasnip  = "[LUA_SNIP]",
                    path     = "[PATH]",
                    cmdline  = "[CMD]"
                })[entry.source.name]
                return vim_item
            end,
        },
        -- You can set mappings if you want
        mapping = cmp.mapping.preset.insert({
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ["<S-Tab>"] = cmp.mapping.select_prev_item(),
            ["<Tab>"] = cmp.mapping.select_next_item()
        }),
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end
        },
        sources = {
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'buffer' },
            { name = 'path' }
        }
    })

    cmp.setup.cmdline({ "/", "?" }, {
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

function config.lua_snip()
    local ls = require('luasnip')
    ls.config.set_config({
        delete_check_events = 'TextChanged,InsertEnter',
    })
    require('luasnip.loaders.from_vscode').lazy_load({
        paths = { './snippets/' },
    })
end

function config.null_ls()
    local null_ls = require("null-ls")
    local diagnostics = null_ls.builtins.diagnostics

    local sources = {
        diagnostics.eslint.with({
            prefer_local = "node_modules/.bin",
            method = null_ls.methods.DIAGNOSTICS_ON_SAVE
        }),
        diagnostics.stylelint.with({
            prefer_local = "node_modules/.bin",
            method = null_ls.methods.DIAGNOSTICS_ON_SAVE
        })
    }

    null_ls.setup({
        default_timeout = 31000,
        sources = sources
    })
end

return config
