" Reference: https://jdhao.github.io/2018/12/24/centos_nvim_install_use_guide_en

" Set no compatiblity mode
set nocompatible

" Remap escape
inoremap jk <Esc>

" Some needed settings
set number
set encoding=utf8
set colorcolumn=80 tabstop=4 shiftwidth=4 softtabstop=4
set showcmd
set expandtab
set autoread
set cursorline
set wildmenu
set relativenumber

" Sets the clipboard to system clipboard
set clipboard=unnamedplus

" Turn on syntax highlighting.
syntax on

filetype plugin on

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

" Always show the status line at the bottom, even if you only have one window
" open.
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

" Open up vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" Clear highlighted entries
nnoremap <leader>c :nohl<CR><C-l>

" For python stuff
au BufNewFile,BufRead *.py
    \ set fileformat=unix

" For stupid web dev
au BufNewFile,BufRead *.js,*.html,*.css,*.jsx
    \ setlocal tabstop=2
    \| setlocal softtabstop=2
    \| setlocal shiftwidth=2

" Install Plug if already not installed
if empty(glob('$HOME/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim"/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

" Install plugins：:PlugInstall
" Update plugins：:PlugUpdate
" Remove plugins：:PlugClean (First, comment the plugin install command
" in init.vim. Open Nvim and use :PlugClean to uninstall plugins)
" Check the plugin status：:PlugStatus
" Upgrade vim-plug itself：:PlugUpgrade

" Gruvbox theme
Plug 'gruvbox-community/gruvbox'

" Airline status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Bracket completion
Plug 'jiangmiao/auto-pairs'

" Commenting Plugin
Plug 'tpope/vim-commentary'

" For neovim terminal usage
Plug 'vimlab/split-term.vim'

" Vim surround :)
Plug 'tpope/vim-surround'

" Plugin to allow sudo write
Plug 'lambdalisue/suda.vim'

" Plugin to show vertical indent bar lines
Plug 'Yggdroot/indentLine'

" For autocomplete, prettier and tslinting
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" List of CoC extensions needed
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-json', 'coc-html', 'coc-prettier', 'coc-pyright', 'coc-clangd']

" Syntax highligthing for js files
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

" Vim Go!!!!
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" VimWiki
Plug 'vimwiki/vimwiki'

" Black integration
Plug 'psf/black', { 'branch': 'stable' }

call plug#end()

" Colorscheme settings
let t_Co=256
set notermguicolors
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

" Airline settings
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1

" Open vertical terminal on f5
set splitbelow
nnoremap <f5> :50VTerm<CR>

" Open horizontal terminal on f4
set splitright
nnoremap <f4> :15Term<CR>

" Coc-Pyright by default looks at root git directory and not subdirectory. 
au FileType python let b:coc_root_patterns = ['.env', 'venv', '.venv', '.git', 'setup.cfg', 'setup.py', 'pyrightconfig.json', 'env']

" Disable indent line on the following files
let g:indentLine_fileTypeExclude = ['json', 'md', 'markdown', 'vimwiki', '.wiki']
let g:indentLine_bufTypeExclude = ['help', 'terminal', 'vimwiki']

" Black settings
let g:black_linelength = 80
let g:black_quiet = 1

" Run Black on save
autocmd BufWritePre *.py execute ':Black'

" Run Black on pressing <F3>
nnoremap <F3> :Black<CR>

let g:python3_host_prog = "/usr/bin/python3"

" Disasble global wiki
let g:vimwiki_global_ext = 0

" Fix vimwiki
let g:indentLine_concealcursor=""
let g:indentLine_conceallevel=2
