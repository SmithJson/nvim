local config = {}

function config.lua_snip()
  local ls = require('luasnip')
  ls.config.set_config({
    delete_check_events = 'TextChanged,InsertEnter',
  })
  require('luasnip.loaders.from_vscode').lazy_load({
    paths = { './snippets/' },
  })
end

function config.auto_pairs()
  require('nvim-autopairs').setup({
    map_cr = false,
  })
end

function config.telescope()
  local fb_actions = require('telescope').extensions.file_browser.actions
  require('telescope').setup({
    defaults = {
      prompt_prefix = ' ',
      selection_caret = ' ',
      layout_config = {
        horizontal = { prompt_position = 'top', results_width = 0.6 },
        vertical = { mirror = false },
      },
      sorting_strategy = 'ascending',
      file_previewer = require('telescope.previewers').vim_buffer_cat.new,
      grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
      qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    },
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      },
      file_browser = {
        mappings = {
          ['n'] = {
            ['c'] = fb_actions.create,
            ['r'] = fb_actions.rename,
            ['d'] = fb_actions.remove,
            ['o'] = fb_actions.open,
            ['u'] = fb_actions.goto_parent_dir,
          },
        },
      },
    },
  })
  require('telescope').load_extension('fzy_native')
  require('telescope').load_extension('file_browser')
end

function config.nvim_treesitter()
  vim.opt.foldmethod = 'expr'
  vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

  local ensure_installed = { 'json', 'jsonc', 'vue', 'html', 'javascript', 'typescript', 'vim', 'bash', 'c', 'cpp', 'css' }

  require('nvim-treesitter.configs').setup({
    ensure_installed = ensure_installed,
    highlight = {
      enable = true,
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false
    },
    textobjects = {
      select = {
        enable = true,
        keymaps = {
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
    },
  })
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
              vim_item.kind = string.format("%s %s", symbol_map[vim_item.kind], vim_item.kind)
              vim_item.menu = ({
                  buffer   = "[BUF]",
                  nvim_lsp = "[LSP]",
                  luasnip  = "[LUA_SNIP]",
                  path = "[PATH]",
                  cmdline = "[CMD]"
              })[entry.source.name]
              return vim_item
          end,
      },
      -- You can set mappings if you want
      mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({select = true}),
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

  cmp.setup.cmdline({"/", "?"}, {
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

return config
