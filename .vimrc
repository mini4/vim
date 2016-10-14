if exists('g:loaded_vimrc')
    finish
endif
let g:loaded_vimrc = 1


set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-sensible'
Plugin 'kien/ctrlp.vim' " Fuzzy file
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" Testing
Plugin 'tristen/vim-sparkup'

call vundle#end()

syntax on
filetype plugin indent on


let mapleader=','

nnoremap <leader>ev :vsplit $MYVIMRC<cr> " Edit my Vimrc file
nnoremap <leader>sv :source $MYVIMRC<cr> " Source my Vimrc file

set noswapfile
set number relativenumber numberwidth=5
set hlsearch

set tabstop=4         " отображение таба 4 пробелами
set softtabstop=4     " замена табов пробелами в режиме вставки
set shiftwidth=4      " сдвиг (>>) на 4 символа
set textwidth=99      " ширина строки
set smarttab          " добавление/удаление отступов на ширину таба
set autoindent        " копирует отступы предыдущей строки
set expandtab
set fileformat=unix

au filetype yaml setl ts=2 sts=2 sw=2
au filetype mako setl textwidth=0 ts=2 sts=2 sw=2
au filetype javascript setl textwidth=0 ts=2 sts=2 sw=2

nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

let g:airline_powerline_fonts=1
let g:airline_theme='cool'


let NERDTreeShowHidden=1
let NERDTreeIgnore=['\~$', '\.swp$', '\.pyc$', '\.pyo$', '\.orig$', '\.rej$']

nnoremap <F3> :NERDTreeToggle<cr>
vnoremap <F3> :NERDTreeToggle<cr>
inoremap <F3> <esc>:NERDTreeToggle<cr>

nnoremap <leader>r :NERDTreeFind<cr>
vnoremap <leader>r :NERDTreeFind<cr>
inoremap <leader>r <esc>:NERDTreeFind<cr>


""" Fuzzy finder
let g:ctrlp_custom_ignore = {
    \ 'file': '\v\.(pyc|pyo|orig|sh|rej)$',
    \ 'dir': '\v(develop-eggs|data|mail|bin|parts|node_modules|bower_components|dist|tmp)$',
    \ }


let s:session_name = 'session'
if exists('g:session_name')
    let s:session_name = g:session_name
endif

let g:session_directory = $HOME . "/.vim/sessions/" . getcwd()
let g:session_default_name = s:session_name
let g:session_autosave = 'no'
let g:session_autoload = 'yes'
let g:session_lock_enabled = 0

au BufNewFile,BufRead *.mako set filetype=mako

let s:vimrc = getcwd() . '/.vimrc'
if filereadable(s:vimrc)
    exe 'so ' . s:vimrc
endif



" Testing & Debugging
" Allow to copy/paste between VIM instances
" "copy the current visual selection to ~/.vbuf
vmap <Leader>y :w! ~/.vbuf<CR>
" "copy the current line to the buffer file if no visual selection
nmap <Leader>y :.w! ~/.vbuf<CR>
" "paste the contents of the buffer file
nmap <Leader>p :r ~/.vbuf<CR>
