#!/usr/bin/env bash
VIMRC="${HOME}/.vimrc"
VIM="${HOME}/.vim"

TARGET="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
VIMRC_TARGET="${TARGET}/.vimrc"
[[ ( ! -L "${VIMRC}" || "$(readlink ${VIMRC})" != "${VIMRC_TARGET}" ) && -f "${VIMRC}" ]] && mv "${VIMRC}" "${HOME}/.viMrc"
[[ -L "${VIMRC}" ]] || ln -s "${VIMRC_TARGET}" "${VIMRC}"

VIM_TARGET="${TARGET}/.vim"
PATH_BUNDLE="${VIM_TARGET}/bundle"
[[ -d "${VIM_TARGET}" || -d "${PATH_BUNDLE}" ]] || mkdir -p "${PATH_BUNDLE}"
[[ ( ! -L "${VIM}" || "$(readlink ${VIM})" != "${VIM_TARGET}" ) && -d "${VIM}" ]] && mv "${VIM}" "${HOME}/.viM"
[[ -L "${VIM}" ]] || ln -s "${VIM_TARGET}" "${VIM}"

for PLUGIN in "vim_lib" "vim_plugmanager" "vim_prj" 
do
  VIM_PLUGIN="${VIM}/bundle/${PLUGIN}"
  [[ -d "${VIM_PLUGIN}" ]] || git clone "https://github.com/Bashka/${PLUGIN}.git" "$VIM_PLUGIN"
done
