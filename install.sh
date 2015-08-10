#!/usr/bin/env bash
VIMRC="${HOME}/.vimrc"
VIM="${HOME}/.vim"

TARGET="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
VIMRC_TARGET="${TARGET}/.vimrc"
[[ ( ! -L "${VIMRC}" || "$(readlink ${VIMRC})" != "${VIMRC_TARGET}" ) && -f "${VIMRC}" ]] && mv "${VIMRC}" "${HOME}/.viMrc"
[[ -L "${VIMRC}" ]] || ln -s "${VIMRC_TARGET}" "${VIMRC}"

VIM_TARGET="${TARGET}/.vim"
[[ ( ! -L "${VIM}" || "$(readlink ${VIM})" != "${VIM_TARGET}" ) && -d "${VIM}" ]] && mv "${VIM}" "${HOME}/.viM"
[[ -L "${VIM}" ]] || ln -s "${VIM_TARGET}" "${VIM}"

VIM_LIB="${VIM}/bundle/vim_lib"
[[ -d "${VIM_LIB}" ]] || git clone "https://github.com/Bashka/vim_lib.git" "$VIM_LIB"

VIM_PLUGMANAGER="${VIM}/bundle/vim_plugmanager"
[[ -d "${VIM_PLUGMANAGER}" ]] || git clone "https://github.com/Bashka/vim_lib.git" "$VIM_PLUGMANAGER"

