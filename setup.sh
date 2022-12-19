#!/usr/bin/env bash

BASEDIR="${HOME}"/$(dirname "$0")
echo "${BASEDIR}"
ln -sf "${BASEDIR}"/.zshrc ~/.zshrc
ln -sf "${BASEDIR}"/nvim ~/.config/nvim
ln -sf "${BASEDIR}"/.asdfrc ~/.asdfrc
ln -sf "${BASEDIR}"/.bashrc ~/
ln -sf "${BASEDIR}"/.sudoers.lecture ~/
ln -sf "${BASEDIR}"/.vim ~/
ln -sf "${BASEDIR}"/.vimrc ~/

bash "${BASEDIR}/asdf_plugins.sh"

wget https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip -O /tmp/hack-nerd-font.zip
unzip /tmp/hack-nerd-font.zip -d /tmp/
wget https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf?raw=true -O /tmp/ttf
echo "Open the fonts file in /tmp/ttf for installation"
