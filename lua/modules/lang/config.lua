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

  require('nvim-treesitter.configs').setup({
    ensure_installed = 'all',
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

return config