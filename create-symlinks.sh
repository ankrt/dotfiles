#!/bin/bash

#
# Link all of the files in this directory with the home directory.
#

ME=`basename "$0"`
DOTFILES=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

for SOURCE in $(ls "$DOTFILES"); do
    if [[ "$ME" =~ "$SOURCE" ]]; then
        # we do not want to symlink this script
        continue;
    fi

    FULL_SOURCE=$DOTFILES/$SOURCE
    DESTINATION=~/.$SOURCE

    echo "Linking $FULL_SOURCE -> $DESTINATION"
    ln -si $FULL_SOURCE $DESTINATION
done
