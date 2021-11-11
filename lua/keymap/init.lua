local bind = require('keymap.bind')
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
require('keymap.config')

local plug_map = {
    ["i|<TAB>"]      = map_cmd('v:lua.tab_complete()'):with_expr():with_silent(),
    ["i|<S-TAB>"]    = map_cmd('v:lua.s_tab_complete()'):with_silent():with_expr(),
    -- Packer
    ["n|<Leader>pu"] = map_cr("PackerUpdate"):with_silent():with_noremap():with_nowait(),
    ["n|<Leader>pi"] = map_cr("PackerInstall"):with_silent():with_noremap():with_nowait(),
    ["n|<Leader>pc"] = map_cr("PackerCompile"):with_silent():with_noremap():with_nowait(),
    -- Nvim-tree
    -- ["n|<Leader>e"] = map_cr('NvimTreeToggle'):with_noremap():with_silent(),
    ["n|<Leader>F"] = map_cr('NvimTreeFindFile'):with_noremap():with_silent(),
    ["n|<Leader>e"] = map_cmd("<cmd>call v:lua.nvim_tree_toggle()<CR>"):with_silent():with_noremap():with_nowait(),
    -- Dashboard
    ['n|<Leader>os'] = map_cu('Dashboard'):with_noremap():with_silent(),
    ["n|<Leader>cn"] = map_cu('DashboardNewFile'):with_noremap():with_silent(),
    ["n|<Leader>fa"] = map_cu('DashboardFindWord'):with_noremap():with_silent(),
    ["n|<Leader>ff"] = map_cu('DashboardFindFile'):with_noremap():with_silent(),
    ["n|<Leader>fh"] = map_cu('DashboardFindHistory'):with_noremap():with_silent(),
    ["n|<Leader>fb"] = map_cu('Telescope buffers'):with_noremap():with_silent(),
    ["n|<Leader>fv"] = map_cu('Telescope vim_options'):with_noremap():with_silent(),
    ["n|<Leader>fw"] = map_cu('Telescope live_grep'):with_noremap():with_silent(),
    ["n|<Leader>tc"] = map_cu('DashboardChangeColorscheme'):with_noremap(),
    -- Bufferline
    ["n|gb"] = map_cr("BufferLinePick"):with_noremap():with_silent(),
    -- which-key-map
    ["n|<Leader>"] = map_cu([[WhichKey '<Space>']]):with_noremap():with_silent(),
    -- Acceleratedjk
    ["n|j"] = map_cmd('v:lua.enhance_jk_move("j")'):with_silent():with_expr(),
    ["n|k"] = map_cmd('v:lua.enhance_jk_move("k")'):with_silent():with_expr(),
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
    ["v|sa"] = map_cmd("<Plug>(operator-surround-append)"):with_silent(),
    ["v|sd"] = map_cmd("<Plug>(operator-surround-delete)"):with_silent(),
    ["v|sr"] = map_cmd("<Plug>(operator-surround-replace)"):with_silent(),
    -- Lsp
    ["n|<C-f>"]= map_cmd("<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>"):with_silent():with_noremap():with_nowait(),
    ["n|<C-b>"]= map_cmd("<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>"):with_silent():with_noremap():with_nowait(),
    ["n|[e"]= map_cr('Lspsaga diagnostic_jump_next'):with_noremap():with_silent(),
    ["n|]e"]= map_cr('Lspsaga diagnostic_jump_prev'):with_noremap():with_silent(),
    ["n|K"]= map_cr("Lspsaga hover_doc"):with_noremap():with_silent(),
    ["n|ga"]= map_cr("Lspsaga code_action"):with_noremap():with_silent(),
    ["v|ga"]= map_cu("Lspsaga range_code_action"):with_noremap():with_silent(),
    ["n|gd"]= map_cr('Lspsaga preview_definition'):with_noremap():with_silent(),
    ["n|gD"]= map_cmd("<cmd>lua vim.lsp.buf.implementation()<CR>"):with_noremap():with_silent(),
    ["n|gs"]= map_cr('Lspsaga signature_help'):with_noremap():with_silent(),
    ["n|gr"]= map_cr('Lspsaga rename'):with_noremap():with_silent(),
    ["n|gh"]= map_cr('Lspsaga lsp_finder'):with_noremap():with_silent(),
    ["n|gt"]= map_cmd("<cmd>lua vim.lsp.buf.type_definition()<CR>"):with_noremap():with_silent(),
    ["n|<Leader>cw"]= map_cmd("<cmd>lua vim.lsp.buf.workspace_symbol()<CR>"):with_noremap():with_silent(),
    ["n|<Leader>ce"]= map_cr('Lspsaga show_line_diagnostics'):with_noremap():with_silent(),
    ["n|<Leader>g"] = map_cu("Lspsaga open_floaterm lazygit"):with_noremap(),
    ["n|<C-k>"] = map_cu("Lspsaga open_floaterm"):with_noremap():with_silent(),
    ["t|<C-k>"] = map_cu([[<C-\><C-n>:Lspsaga close_floaterm<CR>]]):with_noremap():with_silent(),
    -- SymbolOutline
    ["n|<leader>v"] = map_cr('SymbolsOutline'):with_noremap():with_silent(),
    -- Easymotion
    ["n|<Leader>s"] = map_cmd("<Plug>(easymotion-s2)"),
}

bind.nvim_load_mapping(plug_map)
