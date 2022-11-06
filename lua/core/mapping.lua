local bind    = require('keymap.bind')
local map_cr  = bind.map_cr
local map_cmd = bind.map_cmd

local vim_map = {
    -- Nomal
    ["n|<LEADER>w"]    = map_cmd('<C-w>w'):with_noremap(),
    ["n|<LEADER>k"]    = map_cmd('<C-w>k'):with_noremap(),
    ["n|<LEADER>j"]    = map_cmd('<C-w>j'):with_noremap(),
    ["n|<LEADER>h"]    = map_cmd('<C-w>h'):with_noremap(),
    ["n|<LEADER>l"]    = map_cmd('<C-w>l'):with_noremap(),
    ["n|s"]            = map_cmd('<nop>'),
    ["n|sj"]           = map_cmd(':set nosplitbelow<CR>:split<CR>:set splitbelow<CR>'):with_noremap(),
    ["n|sk"]           = map_cmd(':set splitbelow<CR>:split<CR>'):with_noremap(),
    ["n|sh"]           = map_cmd(':set nosplitright<CR>:vsplit<CR>:set splitright<CR>'):with_noremap(),
    ["n|sl"]           = map_cmd(':set splitright<CR>:vsplit<CR>'):with_noremap(),
    ["n|<up>"]         = map_cr('res +5'):with_noremap():with_silent(),
    ["n|<down>"]       = map_cr('res -5'):with_noremap():with_silent(),
    ["n|<left>"]       = map_cr('vertical resize-5'):with_noremap():with_silent(),
    ["n|<right>"]      = map_cr('vertical resize+5'):with_noremap():with_silent(),
    ["n|srh"]          = map_cmd('<C-w>b<C-w>K'):with_noremap(),
    ["n|srv"]          = map_cmd('<C-w>b<C-w>H'):with_noremap(),
    ["n|<LEADER><CR>"] = map_cr("nohlsearch"),
    -- Insert
    ["i|<C-a>"] = map_cmd('<Home>'):with_noremap(),
    ["i|<C-e>"] = map_cmd('<End>'):with_noremap(),
    ["i|<C-f>"] = map_cmd('<Right>'):with_noremap(),
    ["i|<C-b>"] = map_cmd('<Left>'):with_noremap(),
    ["i|<C-n>"] = map_cmd('<Down>'):with_noremap(),
    ["i|<C-p>"] = map_cmd('<Up>'):with_noremap(),
    ["i|<C-j>"] = map_cmd('<Esc>o'):with_noremap(),
    ["i|<C-k>"] = map_cmd('<Esc>O'):with_noremap(),
    -- Visual
    ["v|Y"] = map_cmd('"+y'):with_noremap(),
    -- Command
    ["c|<C-b>"] = map_cmd('<Left>'):with_noremap(),
    ["c|<C-f>"] = map_cmd('<Right>'):with_noremap(),
    ["c|<C-a>"] = map_cmd('<Home>'):with_noremap(),
    ["c|<C-e>"] = map_cmd('<End>'):with_noremap(),
    ["c|<C-d>"] = map_cmd('<Del>'):with_noremap(),
    ["c|<C-h>"] = map_cmd('<BS>'):with_noremap(),
    ["c|<C-t>"] = map_cmd([[<C-R>=expand("%:p:h") . "/" <CR>]]):with_noremap(),
}

bind.nvim_load_mapping(vim_map)
