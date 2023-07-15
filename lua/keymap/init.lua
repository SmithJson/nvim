require('keymap.remap')
local map = require('core.keymap')
local cmd = map.cmd

map.n({
    -- nvim-tree
    ['<Leader>e'] = cmd('NvimTreeFindFileToggle'),

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

    -- which-key-map
    ["<Leader>"] = cmd([[WhichKey '<Space>']]),

    -- Lspsaga
    ['[e'] = cmd('Lspsaga diagnostic_jump_next'),
    [']e'] = cmd('Lspsaga diagnostic_jump_prev'),
    ['K'] = cmd('Lspsaga hover_doc'),
    ['ga'] = cmd('Lspsaga code_action'),
    ['gd'] = cmd('Lspsaga peek_definition'),
    ['gD'] = cmd('Lspsaga goto_definition'),
    ['gr'] = cmd('Lspsaga rename'),
    ['gh'] = cmd('Lspsaga lsp_finder'),
    ['<Leader>o'] = cmd('Lspsaga outline'),
    ['<Leader>ds'] = cmd('Lspsaga show_line_diagnostics'),
    ['<Leader>dw'] = cmd('Lspsaga show_workspace_diagnostics'),
    ['<Leader>db'] = cmd('Lspsaga show_buf_diagnostics'),
})
