-- following options are the default
require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = true,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = true,
  lsp_diagnostics     = false,
  update_focused_file = {
    enable      = true,
    update_cwd  = true,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },

  view = {
    width = 30,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    }
  }
}

vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_indent_markers = 1
-- default mappings
-- vim.g.nvim_tree_bindings = {
--      { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
--      { key = {"<2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },
--      { key = "<C-v>",                        cb = tree_cb("vsplit") },
--      { key = "<C-x>",                        cb = tree_cb("split") },
--      { key = "<C-t>",                        cb = tree_cb("tabnew") },
--      { key = "<",                            cb = tree_cb("prev_sibling") },
--      { key = ">",                            cb = tree_cb("next_sibling") },
--      { key = "P",                            cb = tree_cb("parent_node") },
--      { key = "<BS>",                         cb = tree_cb("close_node") },
--      { key = "<S-CR>",                       cb = tree_cb("close_node") },
--      { key = "<Tab>",                        cb = tree_cb("preview") },
--      { key = "K",                            cb = tree_cb("first_sibling") },
--      { key = "J",                            cb = tree_cb("last_sibling") },
--      { key = "I",                            cb = tree_cb("toggle_ignored") },
--      { key = "H",                            cb = tree_cb("toggle_dotfiles") },
--      { key = "R",                            cb = tree_cb("refresh") },
--      { key = "a",                            cb = tree_cb("create") },
--      { key = "d",                            cb = tree_cb("remove") },
--      { key = "r",                            cb = tree_cb("rename") },
--      { key = "<C-r>",                        cb = tree_cb("full_rename") },
--      { key = "x",                            cb = tree_cb("cut") },
--      { key = "c",                            cb = tree_cb("copy") },
--      { key = "p",                            cb = tree_cb("paste") },
--      { key = "y",                            cb = tree_cb("copy_name") },
--      { key = "Y",                            cb = tree_cb("copy_path") },
--      { key = "gy",                           cb = tree_cb("copy_absolute_path") },
--      { key = "[c",                           cb = tree_cb("prev_git_item") },
--      { key = "]c",                           cb = tree_cb("next_git_item") },
--      { key = "-",                            cb = tree_cb("dir_up") },
--      { key = "q",                            cb = tree_cb("close") },
--      { key = "?",                           cb = tree_cb("toggle_help") },
--  }
vim.g.nvim_tree_icons = {
default =  '',
symlink =  '',
git = {
    unstaged = "✚",
    staged =  "✚",
    unmerged =  "≠",
    renamed =  "≫",
    untracked = "★",
},
}
