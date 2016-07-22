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

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

call vundle#end()

syntax on
filetype plugin indent on


let mapleader=','

nnoremap <leader>ev :vsplit $MYVIMRC<cr> " Edit my Vimrc file
nnoremap <leader>sv :source $MYVIMRC<cr> " Source my Vimrc file

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

nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

let g:airline_powerline_fonts=1


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
    \ 'dir': '\v(develop-eggs|data|mail|node_modules|bin|parts)$',
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



" Indent Python in the Google way.

setlocal indentexpr=GetGooglePythonIndent(v:lnum)

let s:maxoff = 50 " maximum number of lines to look backwards.

function! GetGooglePythonIndent(lnum)

  " Indent inside parens.
  " Align with the open paren unless it is at the end of the line.
  " E.g.
  "   open_paren_not_at_EOL(100,
  "                         (200,
  "                          300),
  "                         400)
  "   open_paren_at_EOL(
  "       100, 200, 300, 400)
  call cursor(a:lnum, 1)
  let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
        \ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
        \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
        \ . " =~ '\\(Comment\\|String\\)$'")
  if par_line > 0
    call cursor(par_line, 1)
    if par_col != col("$") - 1
      return par_col
    esle
        return indent(par_line) + &sw
    endif
  endif

  " Delegate the rest to the original function.
  return GetPythonIndent(a:lnum)

endfunction

let pyindent_nested_paren="&sw"
let pyindent_open_paren="&sw"



" Testing & Debugging
let s:vimrc = getcwd() . '/.vimrc'
if filereadable(s:vimrc)
    exe 'so ' . s:vimrc
endif
