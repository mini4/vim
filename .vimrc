set enc=utf-8      " кодировка по дефолу в файлах

set number
set relativenumber

set ls=2           " всегда показывать статусбар

" переключение между языками Ctrl+^
" set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
set incsearch      " инкреминтируемый поиск
set hlsearch       " подсветка результатов поиска

set shiftwidth=4   " размер отступов
set tabstop=4      " размер табуляций
set smarttab
set expandtab

"set foldenable     " вкл фолдинг (сворачивание участков кода)
"set foldmethod=syntax     " сворачивание по отступам     
"set foldopen=all   " автоматическое открытие сверток при заходе в них

set autochdir      " автоматическое переключение рабочей папки

filetype off
set rtp=~/.vim/bundle/vim_lib
call vim_lib#sys#Autoload#init('~/.vim', 'bundle')

source ~/.vim/plugins.vim

filetype indent plugin on

map <F3> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\~$', '\.swp$', '\.pyc$', '\.pyo$', '\.orig$']

augroup vimrc_hooks
    au!
    au BufWritePost .vimrc so $MYVIMRC
augroup END

function! BufNewFile_PY()
    0put = '#-*- coding: utf-8 -*-'
    $put =
    normal G
endfunction

autocmd BufNewFile *.py call BufNewFile_PY()

" автоматическое закрытие скобок
"imap [ []<LEFT>
"imap ( ()<LEFT>
"imap { {}<LEFT>

" размеры окна
"set lines=100
"set columns=150

"map <leader>r :NERDTreeFind<cr> " поиск текущего буфера файла в дереве
"autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif " автопоиск

"call pathogen#infect()
nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>

"let g:jedi#popup_select_first=0
