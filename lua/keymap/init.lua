local bind = require('keymap.bind')
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
require('keymap.config')

local plug_map = {
    -- toggleterm
    ["n|<C-`>"] = map_cu("ToggleTermToggleAll"):with_silent(),

    -- Nvim-tree
    ["n|<Leader>F"] = map_cr('NvimTreeFindFile'):with_noremap():with_silent(),
    ["n|<Leader>e"] = map_cmd("<cmd>call v:lua.nvim_tree_toggle()<CR>"):with_silent():with_noremap():with_nowait(),

    -- Dashboard
    ['n|<Leader>os'] = map_cu('Dashboard'):with_noremap():with_silent(),
    ["n|<Leader>ff"] = map_cu('Telescope find_files find_command=rg,--hidden,--files'):with_noremap():with_silent(),
    ["n|<Leader>fh"] = map_cu('Telescope oldfiles'):with_noremap():with_silent(),
    ["n|<Leader>fb"] = map_cu('Telescope buffers'):with_noremap():with_silent(),
    ["n|<Leader>fw"] = map_cu('Telescope live_grep'):with_noremap():with_silent(),

    -- which-key-map
    ["n|<Leader>"] = map_cu([[WhichKey '<Space>']]):with_noremap():with_silent(),

    -- VimEft
    ["n|;"]= map_cmd("v:lua.enhance_ft_move(';')"):with_expr(),
    ["x|;"]= map_cmd("v:lua.enhance_ft_move(';')"):with_expr(),
    ["n|f"]= map_cmd("v:lua.enhance_ft_move('f')"):with_expr(),
    ["x|f"]= map_cmd("v:lua.enhance_ft_move('f')"):with_expr(),
    ["o|f"]= map_cmd("v:lua.enhance_ft_move('f')"):with_expr(),
    ["n|F"]= map_cmd("v:lua.enhance_ft_move('F')"):with_expr(),
    ["x|F"]= map_cmd("v:lua.enhance_ft_move('F')"):with_expr(),
    ["o|F"]= map_cmd("v:lua.enhance_ft_move('F')"):with_expr(),

    -- Lspsaga
    ['n|[e']= map_cr('Lspsaga diagnostic_jump_next'):with_noremap():with_silent(),
    ['n|]e']= map_cr('Lspsaga diagnostic_jump_prev'):with_noremap():with_silent(),
    ['n|K'] = map_cr('Lspsaga hover_doc'):with_noremap():with_silent(),
    ['n|ga']= map_cr('Lspsaga code_action'):with_noremap():with_silent(),
    ['n|gd']= map_cr('Lspsaga peek_definition'):with_noremap():with_silent(),
    ['n|gr']= map_cr('Lspsaga rename'):with_noremap():with_silent(),
    ['n|gh']= map_cr('Lspsaga lsp_finder'):with_noremap():with_silent(),
    ['n|<Leader>o'] = map_cu('Lspsaga term_toggle'):with_noremap(),

    -- BufferLine
    ["n|<Tab>"] = map_cr("BufferLineCycleNext"):with_noremap():with_silent(),
    ["n|<S-Tab>"] = map_cr("BufferLineCyclePrev"):with_noremap():with_silent(),
    ["n|<C-p>"] = map_cr("BufferLinePick"):with_noremap():with_silent()
}

bind.nvim_load_mapping(plug_map)
