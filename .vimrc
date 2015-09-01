set number
set relativenumber

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

filetype off
set rtp=~/.vim/bundle/vim_lib
call vim_lib#sys#Autoload#init('~/.vim', 'bundle')

so .vim/plugins.vim

filetype indent plugin on

map <F3> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\~$', '\.swp$', '\.pyc$', '\.pyo$']
