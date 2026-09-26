" options
set nocompatible
set encoding=utf-8
set clipboard=unnamedplus
set ttimeout ttimeoutlen=1
syntax on

set number relativenumber
set hidden autowrite
set undofile noswapfile
set splitbelow splitright
set wildmenu wildmode=longest:full,full
set cursorline scrolloff=4
set ignorecase smartcase incsearch
set shiftwidth=4 tabstop=4 softtabstop=4
set autoindent smartindent

set background=dark
colorscheme catppuccin
hi! Normal ctermbg=NONE guibg=NONE

" keybinds
nnoremap L :bn<CR>
nnoremap P :bp<CR>
nnoremap M :b#<CR>
nnoremap <Esc> :update<Cr>
nnoremap <CR> o<Esc>
