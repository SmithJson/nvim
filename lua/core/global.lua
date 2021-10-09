--[[
Author      : zhanglei103
Date        : 2021-09-25 23:03:22
LastEditors : zhanglei103
LastEditTime: 2021-09-25 23:04:48
Description : Global env
--]]
local global   = {}
local home     = os.getenv("HOME")
local path_sep = global.isWindows and '\\' or '/'
local os_name = vim.loop.os_uname().sysname

function global: load_variables()
    self.is_mac      = os_name == 'Darwin'
    self.is_linux    = os_name == 'Linux'
    self.is_windows  = os_name == 'Windows'
    self.vim_path    = vim.fn.stdpath('config')
    self.cache_dir   = home .. path_sep .. '.cache' .. path_sep .. 'nvim' .. path_sep
    self.modules_dir = self.vim_path .. path_sep .. 'modules'
    self.path_sep    = path_sep
    self.home        = home
    -- local/.share
    self.data_dir = string.format('%s/site/', vim.fn.stdpath('data'))
    print(string.format('%s/site/', vim.fn.stdpath('data')))
end

global: load_variables()

return global
