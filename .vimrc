" options
syntax on
set nocompatible
set encoding=utf-8
set hidden
set undofile
set noswapfile
set clipboard=unnamedplus
set scrolloff=4

set splitbelow
set splitright

set number
set relativenumber

set wildmenu
set wildmode=longest:full,full

set background=dark
set cursorline
colorscheme catppuccin
hi! Normal ctermbg=NONE guibg=NONE

set ignorecase
set smartcase
set incsearch

set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent
set smartindent

set ttimeout
set ttimeoutlen=1
set ttyfast

" keybinds
nnoremap L :bn<CR>
nnoremap P :bp<CR>
nnoremap M :b#<CR>
nnoremap <Esc> :update<Cr>
nnoremap <CR> o<Esc>
