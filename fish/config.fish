set -gx EDITOR nvim

starship init fish | source

source $HOME/.config/fish/conf.d/abbr.fish
source $HOME/.config/fish/conf.d/aliases.fish

[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

set -x FZF_DEFAULT_COMMAND 'ag -g "" --hidden --ignore .git'

# export PROTOC="$HOME/.protoc"
# export PATH="$PATH:/usr/local/bin:$PROTOC/bin"

# pyenv setup
# eval "$(pyenv init -)"
# To enable auto-activation add to your profile:
#if which pyenv-virtualenv-init > /dev/null
#    eval "$(pyenv virtualenv-init -)"
#end

# history
set HISTFILE ~/.histfile
set HISTSIZE 1000000000
set SAVEHIST 1000000000
set HIST_IGNORE_DUPS
set HISTORY_IGNORE '([bf]g *|cd ..|l[alsh]#( *)#|less *|vim# *)'

export GPG_TTY=$(tty)
alias fix-gpg='pkill -9 gpg-agent && export GPG_TTY=$(tty)'

# Go development
export GOPATH="$HOME/go_projects"
export GOBIN="$HOME/go_projects/bin"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:$GOPATH/bin:$GOROOT/bin:$HOME/bin"

# iterm 2 shell integration config
# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"


export PATH="/usr/local/opt/gettext/bin:$PATH"

# fzf config
export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--height 40% --reverse --border --ansi'

set fzf_preview_file_cmd bat
set fzf_default_command "fd --type file --color=always"
set fzf_ctrl_t_command $FZF_DEFAULT_COMMAND
set fzf_preview_dir_cmd exa --all --color=always
set fzf_fd_opts --hidden --exclude=.git
set fzf_default_opts '--height 40% --reverse --border --ansi'

# https://github.com/silvanocerza/dotfiles/blob/master/zsh/zshrc#L44-L55
# If current selection is a text file shows its content,
# if it's a directory shows its content, the rest is ignored
export FZF_CTRL_T_OPTS="--preview-window wrap --preview '
if [[ -f {} ]]; then
    file --mime {} | grep -q \"text\/.*;\" && bat --color \"always\" {} || (tput setaf 1; file --mime {})
elif [[ -d {} ]]; then
    exa -l --color always {}
else;
    tput setaf 1; echo YOU ARE NOT SUPPOSED TO SEE THIS!
fi'"


# # Beginning search with arrow keys
# bindkey "^[OA" up-line-or-beginning-search
# bindkey "^[OB" down-line-or-beginning-search
# bindkey -M vicmd "k" up-line-or-beginning-search
# bindkey -M vicmd "j" down-line-or-beginning-search

export EDITOR='vim'
export KUBE_EDITOR="vim"

# function vi_mode_prompt_info
#   echo "${${KEYMAP/vicmd/[% NORMAL]%}/(main|viins)/[% INSERT]%}"
# end
#
# # define right prompt, regardless of whether the theme defined it
# RPS1='$(vi_mode_prompt_info)'
# RPS2=$RPS1

eval "$(direnv hook fish)"

export HISTTIMEFORMAT="%d/%m/%y %T "
export PATH="/usr/local/opt/openjdk/bin:$PATH"


# #sandboxd
# source "$HOME/.config/sandboxd/sandboxd"

# complete -o nospace -C /usr/local/bin/terraform terraform
# export PATH="$HOME/.jenv/bin:$PATH"
# eval "$(jenv init -)"
# export TALISMAN_INTERACTIVE=true
#
# export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
# export WORKON_HOME=$HOME/.virtualenvs
# pyenv virtualenvwrapper_lazy
#
# complete -o nospace -C /usr/local/bin/vault vault
#
# export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:/usr/local/opt/grep/libexec/gnubin:/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/opt/gnu-indent/libexec/gnubin:/usr/local/opt/findutils/libexec/gnubin:/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
# export PATH="/usr/local/opt/ruby/bin:$PATH"
#

