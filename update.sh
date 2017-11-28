#!/usr/bin/env sh

# Exit immediately if a command exits with a non-zero status.
set -e

# Relative path to dotfiles.
ROOT=$(git rev-parse --show-toplevel)


################################################################################
# GIT-COMPLETION
################################################################################

# Get latest git-completion script.
echo "Getting latest git-completion.bash."

GIT_COMPLETION_BASH_URL=https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
GIT_COMPLETION_BASH_PATH=git/git-completion.bash.symlink

curl -fsSL ${GIT_COMPLETION_BASH_URL} > ${GIT_COMPLETION_BASH_PATH}


################################################################################
# VIM
################################################################################

# Vim Plug.
echo "Getting latest vim-plug script."

VIM_PLUG_URL=https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
VIM_PLUG_PATH=vim/vim.symlink/autoload/plug.vim

curl -fsSL ${VIM_PLUG_URL} > ${VIM_PLUG_PATH}
