local config = {}

function config.neovim_session_manager()
  local Path = require("plenary.path")
  require("session_manager").setup({
    sessions_dir = Path:new(vim.fn.stdpath("data"), "sessions"),
    path_replacer = "__",
    colon_replacer = "++",
    autoload_mode = require("session_manager.config").AutoloadMode.Disabled,
    autosave_last_session = true,
    autosave_ignore_not_normal = true,
    autosave_ignore_filetypes = {
      "gitcommit",
      "dashboard",
      "NvimTree",
      "startify"
    },
    autosave_only_in_session = false,
    max_path_length = 80
  })
end

function config.toggleterm()
  require("toggleterm").setup({
    size = function(term)
      if term.direction == "horizontal" then
        return 30
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.40
      end
    end,
    hide_numbers = true,
    start_in_insert = false,
    open_mapping = [[<c-]>]],
    direction = "vertical",
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

return config
