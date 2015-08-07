#!/usr/bin/env bash
SCRIPTPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
VIMRC=${SCRIPTPATH}/.vimrc
VIM=${SCRIPTPATH}/.vim

VIM_LIB=${VIM}/bundle/vim_lib
[[ -d ${VIM_LIB} ]] || git clone https://github.com/Bashka/vim_lib.git $VIM_LIB
VIM_PLUGMANAGER=${VIM}/bundle/vim_plugmanager
[[ -d ${VIM_PLUGMANAGER} ]] || git clone https://github.com/Bashka/vim_lib.git $VIM_PLUGMANAGER
[[ -L ${VIMRC} ]] && ln -s ${VIMRC} ${HOME}/.vimrc
[[ -L ${VIM} ]] && ln -s ${VIM} ${HOME}/.vim

