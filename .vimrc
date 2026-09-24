" options
set nocompatible
set encoding=utf-8
set clipboard=unnamedplus
syntax on
set number relativenumber
set background=dark
colorscheme catppuccin
hi! Normal ctermbg=NONE guibg=NONE
set hidden undofile noswapfile
set splitbelow splitright
set wildmenu wildmode=longest:full,full
set cursorline scrolloff=4
set ignorecase smartcase incsearch
set shiftwidth=4 tabstop=4 softtabstop=4
set autoindent smartindent
set ttimeout ttimeoutlen=1

" keybinds
nnoremap L :bn<CR>
nnoremap P :bp<CR>
nnoremap M :b#<CR>
nnoremap <Esc> :update<Cr>
nnoremap <CR> o<Esc>
