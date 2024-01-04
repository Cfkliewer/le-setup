

set wildmode=longest,list,full
set wildmenu
set encoding=UTF-8

set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

call plug#begin(stdpath('config') . '/plugged')

	Plug 'williamboman/mason.nvim'
	Plug 'williamboman/mason-lspconfig.nvim'
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/vim-vsnip'
	Plug 'onsails/lspkind-nvim'
	Plug 'nvim-lua/lsp_extensions.nvim'
	Plug 'mortepau/codicons.nvim'
	Plug 'liuchengxu/space-vim-dark'
	Plug 'cseelus/vim-colors-lucid'
	Plug 'whatyouhide/vim-gotham'
	Plug 'jaredgorski/SpaceCamp'
	Plug 'ThePrimeagen/harpoon'
	Plug 'fatih/vim-go'

	Plug 'Exafunction/codeium.nvim'

	Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }


	Plug 'nvim-lua/completion-nvim'
	Plug 'simrat39/symbols-outline.nvim'

	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'nvim-treesitter/playground'

	Plug 'christoomey/vim-tmux-navigator'

	"Plug 'puremourning/vimspector'
	" debuggers
	 Plug 'mfussenegger/nvim-dap'
	 Plug 'rcarriga/nvim-dap-ui'
	" Plug 'Pocco81/DAPInstall.nvim'

	" snippets
	" Plug 'L3MON4D3/LuaSnip'
	" Plug 'rafamadriz/friendly-snippets'

	Plug 'junegunn/gv.vim'
	Plug 'mbbill/undotree'
	Plug 'preservim/nerdtree'

	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'


	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'tpope/vim-surround'
	Plug 'sbdchd/neoformat'
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-telescope/telescope-fzy-native.nvim'
	Plug 'nvim-telescope/telescope-dap.nvim'
	Plug 'lewis6991/gitsigns.nvim'
	Plug 'tpope/vim-fugitive'

	Plug 'xiyaowong/transparent.nvim'


	" Colorscheme
	Plug 'morhetz/gruvbox'
	Plug 'chriskempson/base16-vim'
	Plug 'luisiacc/gruvbox-baby'
	Plug 'folke/tokyonight.nvim'
	Plug 'ryanoasis/vim-devicons'
	Plug 'pineapplegiant/spaceduck'
	Plug 'bluz71/vim-nightfly-colors'
	Plug 'bluz71/vim-moonfly-colors'
	Plug 'rose-pine/neovim'
	Plug 'ayu-theme/ayu-vim'
	Plug 'dracula/vim'
	

call plug#end()


"let g:gruvbox_baby_background_color='dark'
"let g:gruvbox_baby_transparent_mode='true'
"
"let g:tokyonight_style="night"
" let ayucolor="dark"

colorscheme dracula 


let mapleader=' '
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
set termguicolors

lua require('deltabro')
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}

nnoremap <space>ff <cmd>Telescope find_files<cr>
nnoremap <space>fg <cmd>Telescope live_grep<cr>
nnoremap <space>fb <cmd>Telescope buffers<cr>
nnoremap <space>fh <cmd>Telescope help_tags<cr>
nnoremap <space>hm :lua require('harpoon.mark').add_file()<CR>
nnoremap <space>hi :lua require('harpoon.ui').toggle_quick_menu()<CR>
nmap <space>hn :lua require('harpoon.ui').nav_next()<CR>
nmap <space>hp :lua require('harpoon.ui').nav_prev()<CR>
nmap <C-t> :NERDTreeToggle<CR>
nmap <C-n> :NERDTree<CR>
nmap <C-f> :NERDTreeFind<CR>

command! -nargs=1 Switch :lua require('harpoon.tmux').gotoTerminal(<args>)
command! -nargs=1 Nav :lua require('harpoon.ui').nav_file(<args>)

highlight ColorColumn ctermbg=0 guibg=lightgrey
highlight Normal ctermbg=none 
highlight Normal guibg=none 
highlight NonText ctermbg=none 
highlight NonText guibg=none 

let g:neoformat_try_node_exe = 1
let g:lightline = { 'colorscheme': 'rose-pine'}
let g:disable_bg = 1

autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx PrettierAsync

