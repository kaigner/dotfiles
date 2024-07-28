#!/bin/bash

CURRENT_DIR=$(pwd)

create_symlink_with_backup() {
    src=$1
    dest=$2

    if [ -e "$dest" ] || [ -L "$dest" ]; then
        date_suffix=$(date +%Y%m%d)
        backup_dest="${dest}-${date_suffix}"
        echo "Creating backup of $dest as $backup_dest"
        mv "$dest" "$backup_dest"
    fi

    echo "Creating symlink for $dest"
    ln -s "$src" "$dest"
}


create_symlink_with_backup "${CURRENT_DIR}/.tmux.conf" ~/.tmux.conf
create_symlink_with_backup "${CURRENT_DIR}/.zshrc" ~/.zshrc
create_symlink_with_backup "${CURRENT_DIR}/.wezterm.lua" ~/.wezterm.lua
create_symlink_with_backup "${CURRENT_DIR}/.p10k.zsh" ~/.p10k.zsh
create_symlink_with_backup "${CURRENT_DIR}/nvim" ~/.config/nvim
