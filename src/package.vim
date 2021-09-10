" @Author: zhanglei53 <zhanglei53@zuoyebang.com>
" @Date: 2021-01-27 11:58:30
" @Last Modified by: zhanglei103 <zhanglei103@baidu.com>
" @Last Modified time: 2021-09-10 19:01:48

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
Plug 'RRethy/vim-illuminate'
Plug 'glepnir/dashboard-nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'skywind3000/vim-quickui'

" Indent
Plug 'lukas-reineke/indent-blankline.nvim'

" Completion
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'glepnir/lspsaga.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'nvim-lua/completion-nvim'
Plug 'p00f/nvim-ts-rainbow'
Plug 'windwp/nvim-autopairs'
Plug 'ray-x/lsp_signature.nvim'

" Snipeets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim'

" FE
Plug 'mattn/emmet-vim'
Plug 'windwp/nvim-ts-autotag'
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
Plug 'AndrewRadev/tagalong.vim'
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
\}

" Edit
Plug  'kana/vim-operator-user'
Plug  'rhysd/vim-operator-surround'
Plug  'Raimondi/delimitMate'
Plug 'AndrewRadev/switch.vim'
Plug 'psliwka/vim-smoothie'
Plug 'ahonn/vim-fileheader'
Plug 'itchyny/vim-cursorword'

" Autoformat
Plug 'editorconfig/editorconfig-vim'

" Taglist
Plug 'simrat39/symbols-outline.nvim'

" File navigation
Plug 'tomtom/tcomment_vim'
Plug 'airblade/vim-rooter'
Plug 'kshenoy/vim-signature'

" " Undo Tree
Plug 'mbbill/undotree'

" Other useful utilities
Plug 'liuchengxu/vim-which-key'
Plug 'hotoo/pangu.vim'
Plug 'kdheepak/lazygit.nvim'
Plug 'rhysd/accelerated-jk'
Plug 'hrsh7th/vim-eft'

" auto save sessions
call plug#end()
