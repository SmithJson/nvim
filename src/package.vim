" @Author: zhanglei53 <zhanglei53@zuoyebang.com>
" @Date: 2021-01-27 11:58:30
" @Last Modified by: zhanglei53 <zhanglei53@zuoyebang.com>
" @Last Modified time: 2021-02-28 17:20:45

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

call plug#begin($VIM_PATH . '/plugged')
" Beautify
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'glepnir/oceanic-material'
Plug 'glepnir/galaxyline.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'luochen1990/rainbow'
Plug 'bpietravalle/vim-bolt'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'RRethy/vim-illuminate'
Plug 'glepnir/dashboard-nvim'

" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tenfyzhong/CompleteParameter.vim',{'for':['c', 'h', 'cpp', 'py', 'go', 'java', 'vim', 'json', 'hs', 'javascript', 'typescript']}

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim'
Plug 'ferrine/md-img-paste.vim'

" FE
Plug 'othree/html5.vim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'mlaursen/vim-react-snippets'
Plug 'alvan/vim-closetag'
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
Plug 'AndrewRadev/tagalong.vim'
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
\}

" Snipeets
Plug 'honza/vim-snippets'

" Go
Plug 'fatih/vim-go'

" Python
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }

" Edit
Plug 'tpope/vim-surround'
Plug  'gcmt/wildfire.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'psliwka/vim-smoothie'
Plug 'rhysd/accelerated-jk'
Plug 'ahonn/vim-fileheader'

" Autoformat
Plug 'junegunn/vim-easy-align', {'on':'<Plug>(EasyAlign)'}
Plug 'editorconfig/editorconfig-vim'

" Taglist
Plug 'liuchengxu/vista.vim'

" File navigation
Plug 'tomtom/tcomment_vim'
Plug 'airblade/vim-rooter'
Plug 'voldikss/vim-floaterm', { 'on': 'FloatermNew' }
" Plug 'kevinhwang91/rnvimr'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
Plug 'vn-ki/coc-clap'
Plug 'kshenoy/vim-signature'
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'kristijanhusak/defx-icons'
  Plug 'kristijanhusak/defx-git'
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" " Undo Tree
Plug 'mbbill/undotree'

" Other useful utilities
Plug 'lambdalisue/suda.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'hotoo/pangu.vim'
Plug 'andymass/vim-matchup'
Plug 'kdheepak/lazygit.nvim'

" CSharp
Plug 'OmniSharp/omnisharp-vim'
Plug 'ctrlpvim/ctrlp.vim' , { 'for': ['cs', 'vim-plug'] } " omnisharp-vim dependency

" Terminal
Plug 'wincent/terminus'
call plug#end()

