" Reference: https://jdhao.github.io/2018/12/24/centos_nvim_install_use_guide_en

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

" Sets the clipboard to system clipboard
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

" Enable mouse support. You should avoid relying on t
" is too much, but it can
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

" Autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'

" Airline status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Bracket completion
Plug 'jiangmiao/auto-pairs'

" Commenting Plugin
" To comment use: <leader>cc
" <leader> by default is '\'
Plug 'scrooloose/nerdcommenter'

" Autoformatter for neovim
Plug 'sbdchd/neoformat'

" File navigation
Plug 'scrooloose/nerdtree'

" For local vimrc usage
Plug 'vim-scripts/localvimrc'

" For neovim terminal usage
Plug 'vimlab/split-term.vim'

call plug#end()

" Colorscheme settings
let t_Co=256
set notermguicolors
let g:gruvbox_italic=1
colorscheme gruvbox

" Autocompletion deoplete settings
let g:deoplete#enable_at_startup = 1
let g:python3_host_prog = '/home/kunwar/.config/nvim/env/bin/python3'

" Disable autocompletion window after its done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Airline settings
let g:airline_theme='gruvbox'

" Default code formatting for Neoformat
" Enable alignment globally
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion globally
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace globally
let g:neoformat_basic_format_trim = 1

let g:neoformat_enabled_python = ['black']

" Format on pressing f5
nnoremap <f3> :Neoformat<CR>

" NERDTree toggle
nnoremap <silent> <C-B> :NERDTreeToggle<CR>

" Open vertical terminal on f5
set splitbelow
nnoremap <f5> :50VTerm<CR>

" Open horizontal terminal on f4
set splitright
nnoremap <f4> :10Term<CR>
