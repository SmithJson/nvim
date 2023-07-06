local g, api = vim.g, vim.api

g.mapleader = ' '
api.nvim_set_keymap('n', ' ', '', { noremap = true })
api.nvim_set_keymap('x', ' ', '', { noremap = true })

require('core.pack'):boot_strap()
require('core.options')
require('internal.event')
