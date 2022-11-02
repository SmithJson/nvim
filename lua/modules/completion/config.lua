local config = {}

function config.nvim_lsp()
    require('modules.completion.lspconfig')
end

function config.lspsaga()
    local saga = require('lspsaga')
    saga.init_lsp_saga({
        symbol_in_winbar = {
            enable = true
        }
    })
end

function config.nvim_cmp()
    local lspkind = require('lspkind')
    local cmp = require('cmp')
    cmp.setup({
        preselect = cmp.PreselectMode.Item,
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered()
        },
        formatting = {
            format = lspkind.cmp_format({
              mode = 'symbol_text',
              maxwidth = 50,
              ellipsis_char = '...',
              before = function (entry, vim_item)
                   vim_item.menu = ({
                        nvim_lsp = "[LSP]",
                        vsnip = "[Snippet]",
                        buffer = "[Buffer]",
                        path = "[Path]"
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
          {{ name = "buffer" }},
          {{ name = "cmdline" }}
        )
    })
    cmp.setup.cmdline("?", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(
          {{ name = "buffer" }},
          {{ name = "cmdline" }}
        )
    })
    cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(
          {{ name = "path" }},
          {{ name = "cmdline" }}
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
