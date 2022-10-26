local bind = require('keymap.bind')
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
require('keymap.config')

local plug_map = {
    -- toggleterm
    -- ["n|<Leader>tt"] = map_cmd("<cmd>exe v:count.'ToggleTerm'<CR>"):with_silent(),
    -- ["n|<Leader>q"] = map_cu("ToggleTermToggleAll"):with_silent(),

    -- Nvim-tree
    ["n|<Leader>F"] = map_cr('NvimTreeFindFile'):with_noremap():with_silent(),
    ["n|<Leader>e"] = map_cmd("<cmd>call v:lua.nvim_tree_toggle()<CR>"):with_silent():with_noremap():with_nowait(),

    -- Dashboard
    ['n|<Leader>os'] = map_cu('Dashboard'):with_noremap():with_silent(),
    ["n|<Leader>ff"] = map_cu('Telescope find_files find_command=rg,--hidden,--files'):with_noremap():with_silent(),
    ["n|<Leader>fh"] = map_cu('Telescope oldfiles'):with_noremap():with_silent(),
    ["n|<Leader>fb"] = map_cu('Telescope file_browser'):with_noremap():with_silent(),
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

    -- VimOperatorSurround
    -- ["v|sa"] = map_cmd("<Plug>(operator-surround-append)"):with_silent(),
    -- ["v|sd"] = map_cmd("<Plug>(operator-surround-delete)"):with_silent(),
    -- ["v|sr"] = map_cmd("<Plug>(operator-surround-replace)"):with_silent(),

    -- Lspsaga
    ['n|[e']= map_cr('Lspsaga diagnostic_jump_next'):with_noremap():with_silent(),
    ['n|]e']= map_cr('Lspsaga diagnostic_jump_prev'):with_noremap():with_silent(),
    ['n|K'] = map_cr('Lspsaga hover_doc'):with_noremap():with_silent(),
    ['n|ga']= map_cr('Lspsaga code_action'):with_noremap():with_silent(),
    ['n|gd']= map_cr('Lspsaga peek_definition'):with_noremap():with_silent(),
    ['n|gD']= map_cmd('<cmd>lua vim.lsp.buf.implementation()<CR>'):with_noremap():with_silent(),
    ['n|gt']= map_cmd('<cmd>lua vim.lsp.buf.type_definition()<CR>'):with_noremap():with_silent(),
    ['n|gs']= map_cr('Lspsaga signature_help'):with_noremap():with_silent(),
    ['n|gr']= map_cr('Lspsaga rename'):with_noremap():with_silent(),
    ['n|gh']= map_cr('Lspsaga lsp_finder'):with_noremap():with_silent(),
    ['n|<Leader>o'] = map_cu('LSoutlineToggle'):with_noremap(),

    -- Barbar
    ["n|<Tab>"] = map_cr("BufferNext"):with_noremap():with_silent(),
    ["n|<S-Tab>"] = map_cr("BufferPrevious"):with_noremap():with_silent(),
    ["n|<C-p>"] = map_cr("BufferPick"):with_noremap():with_silent(),
    ["n|<A-<>"] = map_cr("BufferMovePrevious"):with_noremap():with_silent(),
    ["n|<A->>"] = map_cr("BufferMoveNext"):with_noremap():with_silent(),
    ["n|<A-c>"] = map_cr("BufferClose"):with_noremap():with_silent(),
    ["n|<Leader>bb"] = map_cr("BufferOrderByBufferNumber"):with_noremap():with_silent(),
    ["n|<Leader>bd"] = map_cr("BufferOrderByDirectory"):with_noremap():with_silent(),
    ["n|<Leader>bl"] = map_cr("BufferOrderByLanguage"):with_noremap():with_silent()
}

bind.nvim_load_mapping(plug_map)
