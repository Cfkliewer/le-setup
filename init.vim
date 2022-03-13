
set wildmode=longest,list,full
set wildmenu

set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

call plug#begin(stdpath('config') . '/plugged')

	" lsp
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/vim-vsnip'
	Plug 'onsails/lspkind-nvim'
	Plug 'nvim-lua/lsp_extensions.nvim'


	" Plug 'nvim-lua/completion-nvim'
	Plug 'glepnir/lspsaga.nvim'
	Plug 'simrat39/symbols-outline.nvim'

	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'nvim-treesitter/playground'

	" debuggers
	" Plug 'mfussenegger/nvim-dap'
	" Plug 'Pocco81/DAPInstall.nvim'

	" snippets
	" Plug 'L3MON4D3/LuaSnip'
	" Plug 'rafamadriz/friendly-snippets'

	Plug 'junegunn/gv.vim'
	Plug 'mbbill/undotree'


	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'tpope/vim-surround'
	Plug 'sbdchd/neoformat'
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-telescope/telescope-fzy-native.nvim'
	Plug 'lewis6991/gitsigns.nvim'
	Plug 'tpope/vim-fugitive'


	" Colorscheme
	Plug 'morhetz/gruvbox'
	Plug 'chriskempson/base16-vim'
	Plug 'luisiacc/gruvbox-baby'
	

call plug#end()


colorscheme gruvbox


let mapleader=" "
set noerrorbells " Don't addsounds for errors
set relativenumber
set nowrap
set nohlsearch
set smartcase
set noswapfile
set nobackup
set undodir=~/AppData/Local/nvim-data/backup
set undofile
set incsearch
set tabstop=2
set softtabstop=0 noexpandtab
set shiftwidth=2
set colorcolumn=120
set clipboard=unnamedplus
set backspace=indent,eol,start

lua require('deltabro')
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}

nnoremap <space>ff <cmd>Telescope find_files<cr>
nnoremap <space>fg <cmd>Telescope live_grep<cr>
nnoremap <space>fb <cmd>Telescope buffers<cr>
nnoremap <space>fh <cmd>Telescope help_tags<cr>

highlight ColorColumn ctermbg=0 guibg=lightgrey

let g:neoformat_try_node_exe = 1

autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx Neoformat

