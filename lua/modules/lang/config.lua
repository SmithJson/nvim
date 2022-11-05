local config = {}

function config.nvim_treesitter()
  vim.api.nvim_command('set foldmethod=expr')
  vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')

  local ignored = {
    'phpdoc',
    'astro',
    'beancount',
    'bibtex',
    'bluprint',
    'eex',
    'embedded_template',
    'vala',
    'wgsl',
    'verilog',
    'twig',
    'turtle',
    'm68k',
    'hocon',
    'lalrpop',
    'meson',
    'mehir',
    'rasi',
    'rego',
    'racket',
    'pug',
    'java',
  }

  local ensure_installed = {
    'vue',
    'json',
    'jsonc',
    'javascript',
    'typescript',
    'html',
    'vim',
    'bash',
    'c',
    'cpp',
    'css'
  }

  require('nvim-treesitter.configs').setup({
    ensure_installed = ensure_installed,
    ignore_install = ignored,
    highlight = {
      enable = true,
    },
    context_commentstring = {
      enable = true,
      config = {
        javascript = {
          __default = '// %s',
          jsx_element = '{/* %s */}',
          jsx_fragment = '{/* %s */}',
          jsx_attribute = '// %s',
          comment = '// %s'
        }
      }
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

function config.todo_comments()
  local status_ok, todo_comments = pcall(require, "todo-comments")
  if not status_ok then
      return
  end

  local error_red = "#DB4B4B"
  local warning_orange = "#ff8800"
  local info_yellow = "#FFCC66"
  local hint_blue = "#4FC1FF"
  local perf_purple = "#BB9AF7"
  local note_green = "#10B981"

  todo_comments.setup({
      keywords = {
          FIX = {
              icon = " ",
              color = error_red,
              alt = {"FIXME", "BUG", "FIXIT", "ISSUE"}
          },
          TODO = {icon = " ", color = hint_blue},
          HACK = {icon = " ", color = info_yellow},
          WARN = {icon = " ", color = warning_orange, alt = {"WARNING", "XXX"}},
          PERF = {icon = " ", color = perf_purple, alt = {"OPTIM", "PERFORMANCE", "OPTIMIZE"}},
          NOTE = {icon = " ", color = note_green, alt = {"INFO"}}
      }
  })
end

function config.null_ls()
        local null_ls = require("null-ls")

    local sources = {
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.formatting.eslint_d
    }

    null_ls.setup({
        sources = sources
    })
end

return config
