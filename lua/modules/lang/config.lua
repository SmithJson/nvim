local config = {}

function config.nvim_treesitter()
  vim.api.nvim_command('set foldmethod=expr')
  vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')

  local ensure_installed = { 'json', 'jsonc', 'vue', 'html', 'javascript', 'typescript', 'vim', 'bash', 'c', 'cpp', 'css' }

  require('nvim-treesitter.configs').setup({
    ensure_installed = ensure_installed,
    highlight = {
      enable = true,
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false
    }
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
        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }
      },
      TODO = { icon = " ", color = hint_blue },
      HACK = { icon = " ", color = info_yellow },
      WARN = { icon = " ", color = warning_orange, alt = { "WARNING", "XXX" } },
      PERF = { icon = " ", color = perf_purple, alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = " ", color = note_green, alt = { "INFO" } }
    }
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
    }),

    -- null_ls.builtins.code_actions.eslint,
    -- null_ls.builtins.code_actions.stylelint,
  }

  null_ls.setup({
    default_timeout = 31000,
    sources = sources
  })
end

return config
