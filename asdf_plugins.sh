asdf plugin add terraform https://github.com/asdf-community/asdf-hashicorp
asdf plugin add terraform-ls https://github.com/asdf-community/asdf-hashicorp
asdf plugin add tfsec https://github.com/woneill/asdf-tfsec
asdf plugin add python https://github.com/danhper/asdf-python.git
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git


echo "Install"
asdf install python 3.8.12
asdf install python latest
asdf install terraform 0.13.6
asdf install tfsec latest
asdf install ruby 2.6.5
asdf install go 1.17.6
