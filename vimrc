set nocompatible
filetype off                  " required
" set the runtime path to include Vundle and initialize
if has("nvim")
set rtp+=~/.config/nvim/bundle/Vundle.vim
else
set rtp+=~/.vim/bundle/Vundle.vim
endif
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
if has("nvim")
call vundle#begin('~/.config/nvim/bundle')
endif

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}
"
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'rust-lang/rust.vim'
Plugin 'vim-scripts/edc-support'
Plugin 'Yggdroot/indentLine'
Plugin 'morhetz/gruvbox'

if has("nvim")
Plugin 'neomake/neomake'
endif

"  ¦ ┆  │ 
let g:indentLine_char = '┆'

" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"For japanese input manager
set iminsert=0
set imsearch=-1

"backspace key
set backspace=indent,eol,start

"syntax highlighting
syntax on

"detect file type and indentation
filetype plugin indent on

" show line numbers
set number

" allow hidden buffers
set hidden

"save more commands
set history=100

"colorscheme industry
set background=dark
colorscheme gruvbox
if has("win32")
set guifont="Ubuntu Mono 9"
elseif has("gui_running")
colorscheme darkspectrum
set guifont=Ubuntu\ Mono\ 13
else
set guifont=Ubuntu\ Mono\ 11
endif

set mouse=a
set hlsearch
set incsearch
set ignorecase
set smartcase

set cindent

" for vim-airline to always appear
set laststatus=2
"let g:airline_powerline_fonts = 1

"let g:rustfmt_autosave = 1

set visualbell

set expandtab
set shiftwidth=2
set softtabstop=2
"set tabstop=2
"set smarttab

set autoindent
set smartindent

" ycm
"let g:ycm_rust_src_path = '~/code/rust/src'
"let g:ycm_rust_src_path = '/home/chris/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
let g:ycm_rust_src_path = '/home/chris/.rustup/toolchains/stable-i686-unknown-linux-gnu/lib/rustlib/src/rust/src'

"nnoremap <Leader>] :YcmCompleter GoTo<CR>
nnoremap <F12> :YcmCompleter GoTo<CR>
nnoremap <F11> :YcmCompleter GetDoc<CR>
nnoremap <F5> :terminal cargo run <CR>

if has("nvim")
let g:neomake_echo_current_error=1
let g:neomake_verbose=0
autocmd! BufWritePost *.rs Neomake cargo
endif
