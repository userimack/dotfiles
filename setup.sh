echo "Creating symlink for the configuration files"

ln -s "$(realpath bashrc)" ~/.bashrc
ln -s "$(realpath zshrc)" ~/.zshrc
ln -s "$(realpath vimrc)" ~/.vimrc
ln -s "$(realpath gitconfig)" ~/.gitconfig
ln -s "$(realpath psqlrc)" ~/.psqlrc
ln -s "$(realpath tmux.conf)" ~/.tmux.conf
echo "TMUX key binding is CTRL+z"

ln -s "$(realpath i3)" ~/.config/i3
ln -s "$(realpath init.vim)" ~/.config/nvim/init.vim
ln -s "$(realpath sudoers.lecture)" ~/sudoers.lecture

ln -s "$(realpath fonts)"  ~/.fonts
