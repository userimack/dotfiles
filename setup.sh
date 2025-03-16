#!/bin/bash

# Function to create symlink if it does not already exist
create_symlink() {
  local source_file="$1"
  local dest_file="$2"
  
  # Check if the symlink already exists
  if [ ! -e "$dest_file" ]; then
    echo "Creating symlink: $dest_file -> $source_file"
    ln -s "$(realpath "$source_file")" "$dest_file"
  else
    echo "Symlink already exists: $dest_file"
  fi
}

echo "Creating symlinks for configuration files"

# List of configuration files and their target destinations
files_to_symlink=(
  ".bashrc:$HOME/.bashrc"
  ".curlrc:$HOME/.curlrc"
  ".zshrc:$HOME/.zshrc"
  ".vimrc:$HOME/.vimrc"
  ".psqlrc:$HOME/.psqlrc"
  ".tmux.conf:$HOME/.tmux.conf"
  "git_configs/.gitignore_global:$HOME/.gitignore_global"
  "git_configs/.git-coauthors:$HOME/.git-coauthors"
  "git_configs/.gitconfig:$HOME/.gitconfig"
  ".sandboxrc:$HOME/.sandboxrc"
  ".talismanrc:$HOME/.talismanrc"
  ".sudoers.lecture:$HOME/.sudoers.lecture"
  ".bash_profile:$HOME/.bash_profile"
  ".myclirc:$HOME/.myclirc"
  ".asdfrc:$HOME/.asdfrc"
  "nvim:$HOME/.config/nvim"
  ".blockyouxlist.txt:$HOME/.blockyouxlist.txt"
)

# Loop through all the files and create symlinks
for file_pair in "${files_to_symlink[@]}"; do
  IFS=":" read -r source_file dest_file <<< "$file_pair"
  create_symlink "$source_file" "$dest_file"
done

echo "TMUX key binding is CTRL+z"

# Optional (commented out) sections for other configurations
# create_symlink "i3" "${HOME}/.config/i3"
# create_symlink "init.vim" "${HOME}/.config/nvim/init.vim"
# create_symlink "fonts" "${HOME}/.fonts"
