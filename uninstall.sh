#!/usr/bin/env bash
VIMRC="${HOME}/.vimrc"
VIM="${HOME}/.vim"

TARGET="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
VIMRC_OLD="${HOME}/.viMrc"
[[ -L "${VIMRC}" && "$(readlink ${VIMRC})" == "${TARGET}/.vimrc" ]] && unlink "${VIMRC}"
[[ -f "${VIMRC_OLD}" ]] && mv "${VIMRC_OLD}" "${VIMRC}"

VIM_OLD="${HOME}/.viM"
[[ -L "${VIM}" && "$(readlink ${VIM})" == "${TARGET}/.vim" ]] && unlink "${VIM}"
[[ -d "${VIM_OLD}" ]] && mv "${VIM_OLD}" "${VIM}"
