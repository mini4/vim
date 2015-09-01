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

for PLUGIN in "mini4/vim_lib" "mini4/vim_plugmanager" "scrooloose/nerdtree"
do
  IFS='/' read -ra ARR <<< "${PLUGIN}"
  PLUGIN_OWNER="${ARR[0]}"
  PLUGIN_NAME="${ARR[1]}"
  PLUGIN_PATH="${VIM}/bundle/${PLUGIN_NAME}"
  [[ -d "${PLUGIN_PATH}" ]] || git clone "https://github.com/${PLUGIN}.git" "${PLUGIN_PATH}"
done

