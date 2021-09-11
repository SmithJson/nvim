if &compatible
	" vint: -ProhibitSetNoCompatible
	set nonocompatible
	" vint: +ProhibitSetNoCompatible
endif

let $VIM_PATH = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')

let s:user_init_config = expand($VIM_PATH.'/init.vim')

" Disable vim distribution plugins
let g:loaded_gzip = 1
let g:loaded_tar = 1
let g:loaded_tarPlugin = 1
let g:loaded_zip = 1
let g:loaded_zipPlugin = 1

let g:loaded_getscript = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_vimball = 1
let g:loaded_vimballPlugin = 1

let g:loaded_matchit = 1
let g:loaded_matchparen = 1
let g:loaded_2html_plugin = 1
let g:loaded_logiPat = 1
let g:loaded_rrhelper = 1

let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

let g:python3_host_skip_check=1
let g:python3_host_prog='/usr/local/bin/python3'
let g:python_host_skip_check=1
let g:python_host_prog='/usr/bin/python'

" Initialize base requirements
if has('vim_starting')
	" Global Mappings "{{{
	" Use spacebar as leader and ; as secondary-leader
	" Required before loading plugins!
	let g:mapleader="\<Space>"
  let g:maplocalleader = ';'

	" Release keymappings prefixes, evict entirely for use of plug-ins.
	nnoremap <Space>  <Nop>
	xnoremap <Space>  <Nop>
	nnoremap ,        <Nop>
	xnoremap ,        <Nop>
	nnoremap ;        <Nop>
	xnoremap ;        <Nop>
endif

call utils#source_file($VIM_PATH,'/src/package.vim')
call utils#source_file($VIM_PATH,'/src/general.vim')
call utils#source_file($VIM_PATH,'/src/filetype.vim')
call utils#source_file($VIM_PATH,'/src/keybindings.vim')

call utils#source_file($VIM_PATH,'/src/run.vim')

luafile $VIM_PATH/modules/dashboard-nvim.lua
luafile $VIM_PATH/modules/nvim-bufferline.lua
luafile $VIM_PATH/modules/indent-blackline.lua
luafile $VIM_PATH/modules/nvim-tree.lua
luafile $VIM_PATH/modules/eviline.lua
luafile $VIM_PATH/modules/gitsigns-nvim.lua
luafile $VIM_PATH/modules/delimimate.lua
luafile $VIM_PATH/modules/cursorword.lua
luafile $VIM_PATH/modules/vista.lua
luafile $VIM_PATH/modules/lsp.lua
luafile $VIM_PATH/modules/nvim-treesitter.lua
luafile $VIM_PATH/modules/autopairs.lua
luafile $VIM_PATH/modules/closetag.lua
luafile $VIM_PATH/modules/emmet-vim.lua

call utils#source_file($VIM_PATH,'/modules/module-undotree.vim')
call utils#source_file($VIM_PATH,'/md-snippets.vim')
call utils#source_file($VIM_PATH,'/modules/module-other.vim')

