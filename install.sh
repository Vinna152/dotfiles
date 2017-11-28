#!/usr/bin/env sh

# Exit immediately if a command exits with a non-zero status.
set -e

# Relative path to dotfiles.
ROOT=$(git rev-parse --show-toplevel)


################################################################################
# VIM
################################################################################

# Preparing temporary directories.
echo "Preparing vim temporary directories."

echo " - Recreating ~/.tmp"
rm -rf ~/.tmp
mkdir -p ~/.tmp

echo " - Recreating ~/.tmp/bak"
rm -rf ~/.tmp/bak
mkdir -p ~/.tmp/bak

echo " - Recreating ~/.tmp/swp"
rm -rf ~/.tmp/swp
mkdir -p ~/.tmp/swp

echo " - Recreating ~/.tmp/undo"
rm -rf ~/.tmp/undo
mkdir -p ~/.tmp/undo

echo "Installing plugins."
vim +silent +VimEnter +PlugInstall +qall


################################################################################
# SYMLINKS
################################################################################

echo "Installing symlinks."
SYMLINKS=$(find . -not -path "*/\.git*" -name "*.symlink")

for SYMLINK in ${SYMLINKS}
do
    # Get basename from symlink.
    SYMLINK_FILE=$(basename ${SYMLINK})

    # Formulating .dotfile notation.
    DOTFILE=.$(echo ${SYMLINK_FILE} | sed -e "s/.symlink//g")

    # First remove .dotfiles.
    echo " - Removing ~/${DOTFILE}"
    rm -rf ~/${DOTFILE}

    # Then re-link them.
    echo " - Linking ${SYMLINK} to ~/${DOTFILE}"
    ln -fs "${ROOT}/${SYMLINK}" ~/${DOTFILE}
done


################################################################################
# ZSH
################################################################################

echo "Setting default shell to zsh."
chsh -s /bin/zsh
