local config = {}

function config.nvim_lsp()
<<<<<<< HEAD
    require('modules.completion.lspconfig')
=======
  require('modules.completion.lspconfig')
>>>>>>> 7ad35742ed8b84558596553c4c741eb96a268202
end

function config.lspsaga()
    local saga = require('lspsaga')
    saga.init_lsp_saga({
<<<<<<< HEAD
        symbol_in_winbar = {
            enable = true
        }
=======
      symbol_in_winbar = {
        enable = true,
      },
>>>>>>> 7ad35742ed8b84558596553c4c741eb96a268202
    })
end

function config.nvim_cmp()
<<<<<<< HEAD
    local feedkey = function(key, mode)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
    end

    local cmp = require('cmp')
    cmp.setup({
        preselect = cmp.PreselectMode.Item,
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered()
        },
        formatting = {
            fields = {'abbr', 'kind', 'menu'}
        },
        -- You can set mappings if you want
        mapping = cmp.mapping.preset.insert({
            ['<C-e>'] = cmp.config.disable,
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ["<CR>"] = cmp.mapping.confirm({
                select = true
            }),
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif vim.fn["vsnip#jumpable"](1) == 1 then
                    feedkey("<Plug>(vsnip-jump-next)", "")
                else
                    fallback()
                end
            end, {"i", "s"}),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
=======
    local cmp = require('cmp')
    cmp.setup({
      preselect = cmp.PreselectMode.Item,
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      formatting = {
        fields = { 'abbr', 'kind', 'menu' },
      },
      -- You can set mappings if you want
      mapping = cmp.mapping.preset.insert({
        ['<C-e>'] = cmp.config.disable,
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
>>>>>>> 7ad35742ed8b84558596553c4c741eb96a268202
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                    feedkey("<Plug>(vsnip-jump-prev)", "")
                else
<<<<<<< HEAD
                    fallback()
                end
            end, {"i", "s"})
        }),
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'vsnip' },
          { name = 'path' },
          { name = 'buffer' }
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

=======
                    fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
                end
            end,
            {"i", "s"}
        )
      }),
      snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'path' },
        { name = 'buffer' },
      },
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
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
end

>>>>>>> 7ad35742ed8b84558596553c4c741eb96a268202
function config.vsnip()
    if not packer_plugins["vim-vsnip"].loaded then
        vim.cmd [[packadd vim-vsnip]]
    end
    vim.g.vsnip_snippet_dir = os.getenv("HOME") .. "/.config/nvim/snippets"
end

return config