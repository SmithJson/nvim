require('keymap.remap')
require('keymap.config')
local map = require('core.keymap')
local cmd = map.cmd

map.n({
    -- Nvim-tree
    ['<Leader>e'] = cmd('call v:lua.nvim_tree_toggle()'),

    -- Dashboard
    ['<Leader>os'] = cmd('Dashboard'),
    ["<Leader>ff"] = cmd('Telescope find_files find_command=rg,--hidden,--files'),
    ["<Leader>fh"] = cmd('Telescope oldfiles'),
    ["<Leader>fb"] = cmd('Telescope buffers'),
    ["<Leader>fw"] = cmd('Telescope live_grep'),

    -- BufferLine
    ['<Tab>'] = cmd('BufferLineCycleNext'),
    ['<S-Tab>'] = cmd('BufferLineCyclePrev'),
    ['<C-p>'] = cmd('BufferLinePick'),
})
