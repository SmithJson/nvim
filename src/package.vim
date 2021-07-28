" @Author: zhanglei53 <zhanglei53@zuoyebang.com>
" @Date: 2021-01-27 11:58:30
" @Last Modified by: zhanglei103 <zhanglei103@baidu.com>
" @Last Modified time: 2021-07-28 20:35:12

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

call plug#begin($VIM_PATH . '/plugged')

" Beautify
Plug 'glepnir/zephyr-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'glepnir/galaxyline.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'luochen1990/rainbow'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'RRethy/vim-illuminate'
Plug 'glepnir/dashboard-nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'othree/yajs.vim'
Plug 'HerringtonDarkholme/yats.vim'

" Indent
" Plug 'ntpeters/vim-better-whitespace'
Plug 'lukas-reineke/indent-blankline.nvim'

" Completion
" Plug 'tenfyzhong/CompleteParameter.vim',{'for':['c', 'h', 'cpp', 'py', 'go', 'java', 'vim', 'json', 'hs', 'javascript', 'typescript']}

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
Plug 'AndrewRadev/splitjoin.vim'
Plug 'posva/vim-vue'
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
\}

" Snipeets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Go
" Plug 'fatih/vim-go'

" Python
" Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }

" Edit
Plug 'tpope/vim-surround'
Plug  'gcmt/wildfire.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'psliwka/vim-smoothie'
Plug 'ahonn/vim-fileheader'

" Autoformat
" Plug 'junegunn/vim-easy-align', {'on':'<Plug>(EasyAlign)'}
Plug 'editorconfig/editorconfig-vim'

" Taglist
Plug 'liuchengxu/vista.vim'

" File navigation
Plug 'tomtom/tcomment_vim'
Plug 'airblade/vim-rooter'
Plug 'voldikss/vim-floaterm', { 'on': 'FloatermNew' }
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
Plug 'kshenoy/vim-signature'

" " Undo Tree
Plug 'mbbill/undotree'

" Other useful utilities
Plug 'lambdalisue/suda.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'hotoo/pangu.vim'
Plug 'kdheepak/lazygit.nvim'
Plug 'rhysd/accelerated-jk'

" CSharp
Plug 'ctrlpvim/ctrlp.vim' , { 'for': ['cs', 'vim-plug'] } " omnisharp-vim dependency
call plug#end()

