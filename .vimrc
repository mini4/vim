set number
set relativenumber

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

filetype off
set rtp=~/.vim/bundle/vim_lib
call vim_lib#sys#Autoload#init('~/.vim', 'bundle')

Plugin 'vim_lib'
Plugin 'vim_plugmanager'
Plugin 'vim_prj'

filetype indent plugin on

