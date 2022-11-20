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
    local cmp = require('cmp')
    cmp.setup({
        preselect = cmp.PreselectMode.Item,
        window = {
            completion = {
              winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
              col_offset = -3,
              side_padding = 0
            },
            documentation = cmp.config.window.bordered()
        },
        formatting = {
            fields = { "kind", "abbr", "menu" },
            format = function(entry, vim_item)
              local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
              local strings = vim.split(kind.kind, "%s", { trimempty = true })
              kind.kind = " " .. strings[1] .. " "
              kind.menu = "    (" .. strings[2] .. ")"
              return kind
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
