local config = {}

function config.vim_cursorwod()
  vim.api.nvim_command('augroup user_plugin_cursorword')
  vim.api.nvim_command('autocmd!')
  vim.api.nvim_command('autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0')
  vim.api.nvim_command('autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif')
  vim.api.nvim_command('autocmd InsertEnter * let b:cursorword = 0')
  vim.api.nvim_command('autocmd InsertLeave * let b:cursorword = 1')
  vim.api.nvim_command('augroup END')
end

function config.nvim_colorizer() require('colorizer').setup() end

function config.emmet()
    vim.g.user_emmet_complete_tag = 1
    vim.g.user_emmet_install_global = 1
    vim.g.user_emmet_install_command = 1
    vim.g.user_emmet_mode = 'i'
end

return config
