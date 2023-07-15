local config = {}

function config.lspconfig()
    require('modules.completion.lsp')
end

function config.nvim_cmp()
    local border_opts = {
        border = "single",
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None"
    }
    local cmp = require('cmp')
    local lspkind = require('lspkind')

    cmp.setup({
        preselect = cmp.PreselectMode.None,
        window = {
            completion = cmp.config.window.bordered(border_opts),
            documentation = cmp.config.window.bordered(border_opts),
        },
        formatting = {
            format = lspkind.cmp_format({
              mode = 'symbol_text',
              maxwidth = 50,
              ellipsis_char = '...',
              before = function (entry, vim_item)
                vim_item.menu = ({
                    buffer   = "[BUF]",
                    nvim_lsp = "[LSP]",
                    luasnip  = "[LUA_SNIP]",
                    path     = "[PATH]",
                    cmdline  = "[CMD]"
                })[entry.source.name]
                return vim_item
              end
            })
        },
        -- You can set mappings if you want
        mapping = cmp.mapping.preset.insert({
            ['<C-e>'] = cmp.config.disable,
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
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
            method = null_ls.methods.DIAGNOSTICS_ON_SAVE
        }),
        diagnostics.stylelint.with({
            filetypes = {'scss', 'less', 'css', 'sass', 'vue'},
            method = null_ls.methods.DIAGNOSTICS_ON_SAVE
        })
    }

    null_ls.setup({
        sources = sources
    })
end

return config
