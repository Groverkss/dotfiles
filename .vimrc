" Set no compatiblity mode
set nocompatible

" Remap escape
inoremap jk <Esc>

" Some needed settings
set number
set colorcolumn=80
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set clipboard=unnamedplus

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Set Darkmode
set bg=dark

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a


call plug#begin('~/.local/share/nvim/plugged')

" Install plugins：:PlugInstall
" Update plugins：:PlugUpdate
" Remove plugins：:PlugClean (First, comment the plugin install command
" in init.vim. Open Nvim and use :PlugClean to uninstall plugins)
" Check the plugin status：:PlugStatus
" Upgrade vim-plug itself：:PlugUpgrade

" Gruvbox theme
Plug 'morhetz/gruvbox'

" Bracket completion
Plug 'jiangmiao/auto-pairs'

" Airline status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Colorscheme settings
let t_Co=256
set notermguicolors
let g:gruvbox_italic=1
colorscheme gruvbox

" Airline settings
let g:airline_theme='gruvbox'
