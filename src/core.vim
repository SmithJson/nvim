if &compatible
	" vint: -ProhibitSetNoCompatible
	set nocompatible
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

call utils#source_file($VIM_PATH,'/modules/module-floaterm.vim')
call utils#source_file($VIM_PATH,'/modules/module-dashboard.vim')
call utils#source_file($VIM_PATH,'/modules/module-undotree.vim')
call utils#source_file($VIM_PATH,'/modules/module-rnvimr.vim')
call utils#source_file($VIM_PATH,'/modules/module-closetag.vim')

luafile $VIM_PATH/modules/module-indentline.lua
luafile $VIM_PATH/modules/module-colorizer.lua

call utils#source_file($VIM_PATH,'/modules/module-clap.vim')
" call utils#source_file($VIM_PATH,'/modules/module-coc.vim')
call utils#source_file($VIM_PATH,'/modules/module-lsp.vim')
" call utils#source_file($VIM_PATH,'/modules/module-vim-go.vim')
call utils#source_file($VIM_PATH,'/modules/module-vista.vim')
call utils#source_file($VIM_PATH,'/modules/module-defx.vim')
call utils#source_file($VIM_PATH,'/modules/module-other.vim')

call utils#source_file($VIM_PATH,'/src/format.vim')
call utils#source_file($VIM_PATH,'/md-snippets.vim')

call utils#source_file($VIM_PATH,'/_machine_specific.vim')
call utils#source_file($VIM_PATH,'/modules/module-markdown.vim')
call utils#source_file($VIM_PATH,'/src/keybindings.vim')
call utils#source_file($VIM_PATH,'/src/run.vim')

luafile $VIM_PATH/src/eviline.lua

" call theme#init()
