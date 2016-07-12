set nocompatible
execute pathogen#infect()

syntax on
filetype plugin indent on


let mapleader=','

nnoremap <leader>ev :vsplit $MYVIMRC<cr> " Edit my Vimrc file
nnoremap <leader>sv :source $MYVIMRC<cr> " Source my Vimrc file

set number relativenumber numberwidth=5
"highlight LineNr ctermfg=grey
"highlight CursorLineNr ctermfg=grey
set hlsearch

set tabstop=4         " отображение таба 4 пробелами
set softtabstop=4     " замена табов пробелами в режиме вставки
set shiftwidth=4      " сдвиг (>>) на 4 символа
set textwidth=99      " ширина строки
set smarttab          " добавление/удаление отступов на ширину таба
set autoindent        " копирует отступы предыдущей строки
set expandtab
set fileformat=unix

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let g:airline_powerline_fonts=1


let NERDTreeShowHidden=1
let NERDTreeIgnore=['\~$', '\.swp$', '\.pyc$', '\.pyo$', '\.orig$', '\.rej$']

nnoremap <F3> :NERDTreeToggle<CR>
vnoremap <F3> :NERDTreeToggle<CR>
inoremap <F3> <esc>:NERDTreeToggle<CR>

nnoremap <leader>r :NERDTreeFind<CR>
vnoremap <leader>r :NERDTreeFind<CR>
inoremap <leader>r <esc>:NERDTreeFind<CR>


""" Fuzzy finder
let g:ctrlp_custom_ignore = {
    \ 'file': '\v\.(pyc|pyo|orig|sh|rej)$',
    \ 'dir': '\v(develop-eggs|data|mail|node_modules|bin|parts)$',
    \ }


""" http://vim.wikia.com/wiki/Go_away_and_come_back
" Creates a session
function! MakeSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' . b:sessiondir
    redraw!
  endif
  let b:sessionfile = b:sessiondir .'/session.vim'
  exe "mksession! " . b:sessionfile
  echo "creating session"
endfunction

" Updates a session, BUT ONLY IF IT ALREADY EXISTS
function! UpdateSession()
  let b:sessiondir = $HOME . "/.vim/sessions" .getcwd()
  let b:sessionfile = b:sessiondir . "session.vim"
  if (filereadable(b:sessionfile))
    exe "mksession! " . b:sessionfile
    echo "updating session"
  endif
endfunction

" Loads a session if it exists
function! LoadSession()
  if argc() == 0
    let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
    let b:sessionfile = b:sessiondir . "/session.vim"
    if (filereadable(b:sessionfile))
      exe 'source ' . b:sessionfile
    else
      echo "No session loaded."
    endif
  else
    let b:sessionfile = ""
    let b:sessiondir = ""
  endif
endfunction

let g:session_directory = $HOME . "/.vim/sessions/" . getcwd()
let g:session_default_name = 'session'
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
let g:session_lock_enabled = 0
"if (filewritable(g:session_directory) != 2)
"  exe 'silent !mkdir -p ' . g:session_directory
"  redraw!
"endif
"au VimEnter * nested :call LoadSession()
"au VimLeave * :call UpdateSession()
"map <leader>m :call MakeSession()<CR>

au BufNewFile,BufRead *.mako set filetype=mako
"au FileType python noremap <leader>b Oimport<space>pdb;pdb.set_trace()<esc>:w<cr>



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
