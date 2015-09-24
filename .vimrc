set enc=utf-8      " кодировка по дефолу в файлах

set number
set relativenumber

set ls=2           " всегда показывать статусбар

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
set incsearch      " инкреминтируемый поиск
set hlsearch       " подсветка результатов поиска

set tabstop=4
set shiftwidth=4
set expandtab

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
