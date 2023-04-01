 zmodload zsh/zprof
# To disable insecure directory error
#ZSH_DISABLE_COMPFIX=true

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  z
  git
  kubectl
  # docker
  # docker-compose
  vi-mode
  # globalias
  pass
  # zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#  ------------------------------
#  User Configuration
#  ------------------------------

# setting vim bindings
# set -o vi


export PROTOC="$HOME/.protoc"
export PATH="$PATH:/usr/local/bin:${PROTOC}/bin"

# # pyenv setup
# eval "$(pyenv init -)"
# # To enable auto-activation add to your profile:
# if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
# export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
# export WORKON_HOME=$HOME/.virtualenvs
# pyenv virtualenvwrapper_lazy



export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#-------------------------------------------------------------
# zsh options
#-------------------------------------------------------------


# completions
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# fuzzy completion
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:[[:ascii:]]||[[:ascii:]]=** r:|=* m:{a-z\-}={A-Z\_}'
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*' format $'\n%F{green}%d%f'
zstyle ':completion:*' group-name ''
setopt COMPLETE_ALIASES

# history
HISTFILE=~/.histfile
HISTSIZE=1000000000
SAVEHIST=1000000000
setopt HIST_IGNORE_DUPS
HISTORY_IGNORE='([bf]g *|cd ..|l[alsh]#( *)#|less *|vim# *)'


zstyle ':completion:*' menu select

# Go development
export GOPATH="$HOME/go_projects"
export GOBIN="$HOME/go_projects/bin"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:$GOPATH/bin:$GOROOT/bin:$HOME/bin"

# iterm 2 shell integration config
# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# export PATH="/usr/local/opt/openssl/bin:$PATH"
# export PATH="/usr/local/opt/icu4c/bin:$PATH"
# export PATH="/usr/local/opt/icu4c/sbin:$PATH"


export PATH="$(brew --prefix gettext)/bin:$PATH"

# fzf settings https://github.com/junegunn/fzf
 [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--height 40% --reverse --border --ansi'

# https://github.com/silvanocerza/dotfiles/blob/master/zsh/zshrc#L44-L55
# If current selection is a text file shows its content,
# if it's a directory shows its content, the rest is ignored
FZF_CTRL_T_OPTS="--preview-window wrap --preview '
if [[ -f {} ]]; then
    file --mime {} | grep -q \"text\/.*;\" && bat --color \"always\" {} || (tput setaf 1; file --mime {})
elif [[ -d {} ]]; then
    exa -l --color always {}
else;
    tput setaf 1; echo YOU ARE NOT SUPPOSED TO SEE THIS!
fi'"

# key bindings
# bindkey "\e[1~" beginning-of-line
# bindkey "\e[4~" end-of-line

# Beginning search with arrow keys
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/[% NORMAL]%}/(main|viins)/[% INSERT]%}"
}

# define right prompt, regardless of whether the theme defined it
RPS1='$(vi_mode_prompt_info)'
RPS2=$RPS1



# uncomment to setup minikube - docker env
# eval $(minikube docker-env)

export EDITOR='vim'
export KUBE_EDITOR="vim"

# flutter setup
# export PATH="$PATH:$HOME/flutter/bin"

# Android SDK development setup
#export ANDROID_HOME=$HOME/Library/Android/sdk
#export PATH=$PATH:$ANDROID_HOME/emulator
#export PATH=$PATH:$ANDROID_HOME/tools
#export PATH=$PATH:$ANDROID_HOME/tools/bin
#export PATH=$PATH:$ANDROID_HOME/platform-tools

# version control status
DISABLE_UNTRACKED_FILES_DIRTY="true"

eval "$(direnv hook zsh)"

export HISTTIMEFORMAT="%d/%m/%y %T "
export PATH="$(brew --prefix openjdk)/bin:$PATH"


# #sandboxd
# source "$HOME/.config/sandboxd/sandboxd"

#
# ############################################## ALIAS #######################################
# source "$HOME/dotfiles/.zshrc.alias"

#-------------------------------------------------------------
# aliases
#-------------------------------------------------------------

# basic utils
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'

# prevents accidentally clobbering files
alias mkdir='mkdir -p'

# pretty-print of some PATH variables
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'

# git related aliases
# alias gc='git commit -am'
alias gl='git log --graph --oneline --decorate --all'
alias gs='git status -sb'
alias gshow='git show --name-only --oneline HEAD'
alias gshowf='git show --oneline'

# web services
alias weather='curl -s wttr.in/Hyderabad | head -7'
alias weatherforecast='curl -s wttr.in/Hyderabad | head -37 | tail -30'
qrcode() {
    echo $@ | curl -F-=\<- qrenco.de
}

alias myip='ipconfig getifaddr en1 || ipconfig getifaddr en0'

alias dif='diff --side-by-side --suppress-common-lines'
alias named='find . -name'
alias ql='qlmanage -p 2>/dev/null'

# base64 encode and decode helper function for shell
encode64(){ printf '%s' $1 | base64 }
decode64(){ printf '%s' $1 | base64 --decode }
alias e64=encode64
alias d64=decode64
# usage - e64 test and d64 dGVzdAo=

alias -g b64='| base64'
alias -g b64d='| base64 -D'
# usage - echo "test" b64 and echo "dGVzdAo=" b64d

# it helps in traversing files in different branches
# Like: git show branch_name:/path/to/file.py | vim.py
alias vim.py="vim - -c 'set syntax=python'"

# vim configs
alias vim='nvim'
alias vi='nvim'
alias vimdiff="nvim -d"

alias d='deactivate'
alias exa="exa -abghl --git"
alias l='ls -lhtr'
alias ll='ls -lhSr'  # -l = list , -h = human readable sizes, -S = Sort descending, -r = reverse sorting
# alias server='echo "Starting server on $(ifconfig | grep "inet\ 192" | cut -d" " -f2):8000"; python2.7 -m SimpleHTTPServer'
alias server='echo "Starting server on http://$(ipconfig getifaddr en1 || ipconfig getifaddr en0):8000"; python3 -m http.server'

# using xc command whatever you pipe to it, it will print and copy the same to clipboard
# alias xc='tee /dev/tty|xclip -selection clipboard'


# Functions duone and dutwo are to get size of each file in the directory#
function duone()
{
    du -k --max-depth 1 $1 | sort -n
}

function dutwo()
{
    du -hs * |sort -h -r
}

# removing rm command and using trash command
# alias rm="echo Use 'trash', or the full path i.e. '/bin/rm'"
alias tmux='tmux -u'

# # autojump configuration
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
alias j='z'

alias pmr='python manage.py runserver'

# chrome setup
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

# ipython aliases
alias ipython3='ipython3 --TerminalInteractiveShell.editing_mode=vi'
alias ipython='ipython --TerminalInteractiveShell.editing_mode=vi'
alias ip='ipython'

# pytest with coverage
alias pycov='pytest -sv --cov-report term-missing --cov=. '

alias ydl='youtube-dl'
alias say='say -v Samantha'

alias find_dir_chmod='find . -type d -exec chmod 744 {} \;'
alias find_file_chmod='find . -type f -exec chmod 644 {} \;'
alias find_dup='gfind . ! -empty -type f -exec md5sum {} + 2>/dev/null | sort | guniq -w32 -dD '



# Add the following to .zshrc/.bashrc...etc
# Allows setting default namespace while working with kubectl #

alias k='kubectl'
alias kcc='kubectl config current-context'
alias kgc='kubectl config get-contexts'
alias kge='kubectl get events --sort-by='\''{.lastTimestamp}'\'
alias kgp='kubectl get pods'
alias kl='kubectl logs '
alias kpf='kubectl port-forward'
alias ksc='kubectl config use-context'

alias ksn='_f(){k get namespace $1 > /dev/null; if [ $? -eq 1 ]; then return $?; fi;  k config set-context $(k config current-context) --namespace=$1; echo "Namespace: $1"};_f'

alias knl="kubectl config get-contexts"
alias kn='kubectl config set-context --current --namespace '
# kn default

#Usage:
#➜  ~ ksn dev1                                                       (dev-context/dev1)
#     Context "dev-context" modified.
#     Namespace: dev1

#➜  ~ ksn ff                                                         (dev-context/dev1)
#     Error from server (NotFound): namespaces "ff" not found

alias cat='bat'

function ansible_doc() {
    ansible-doc "$1" | bat --language=yml
}

alias tf='terraform'

alias pp='jq -C . | less -FX'
#cat foo.json | pp

alias dfimage="docker run -v /var/run/docker.sock:/var/run/docker.sock --rm alpine/dfimage"

#function dih {docker history --no-trunc $argv  | tac | tr -s ' ' | cut -d " " -f 5- | sed 's,^/bin/sh -c #(nop) ,,g' | sed 's,^/bin/sh -c,RUN,g' | sed 's, && ,\n  & ,g' | sed 's,\s*[0-9]*[\.]*[0-9]*\s*[kMG]*B\s*$,,g' | head -n -1}
#

# install required: brew install lsd
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

alias du='dust'
alias df='duf'
alias curl='curlie'


alias gp_stop='launchctl unload /Library/LaunchAgents/com.paloaltonetworks.gp.pangp*'
alias gp_start='launchctl load /Library/LaunchAgents/com.paloaltonetworks.gp.pangp*'


##############################################################################################
#
# ############################################## UTILS #######################################
#
# source "$HOME/dotfiles/.zshrc.utils"
# # function to go latest chnaged directory
function ol ()
{
    latest_dir=$(ls -tr | tail -1);
    echo "cding into $latest_dir";
    cd "$latest_dir"
}

function sudo(){
    \cat ~/.sudoers.lecture
    /usr/bin/sudo $@
}


# extract archives
function extract()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   echo tar xvjf $1   && tar xvjf $1     ;;
            *.tar.gz)    echo tar xvzf $1   && tar xvzf $1     ;;
            *.bz2)       echo bunzip2 $1    && bunzip2 $1      ;;
            *.rar)       echo unrar x $1    && unrar x $1      ;;
            *.gz)        echo gunzip $1     &&  gunzip $1      ;;
            *.tar)       echo tar xvf $1    &&  tar xvf $1   ;;
            *.tbz2)      echo tar xvjf $1   &&  tar xvjf $1  ;;
            *.tgz)       echo tar xvzf $1   && tar xvzf $1  ;;
            *.zip)       echo unzip $1   && unzip $1      ;;
            *.Z)         echo uncompress $1  &&  uncompress $1   ;;
            *.7z)        echo 7z x $1    && 7z x $1       ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

# open up ~/.zshrc for editing, if present else ~/.bashrc
function zz() {
    if [ -f ${HOME}/.zshrc ]; then
        vim ${HOME}/.zshrc
    else
        vim ${HOME}/.bashrc
    fi
}


# open up ~/.config/nvim/init.vim for editing, or ~/.vimrc
function vv() {
    if [ -f ${HOME}/.config/nvim/init.vim ]; then
        vim ${HOME}/.config/nvim/init.vim
    else
        vim ${HOME}/.vimrc
    fi
}

function VCDOTFILES() {
    cd $HOME/dotfiles/
    echo "last commit - \\n------------------------------------------"
    git show --stat --oneline HEAD | tail
    # git log -1 | tail
    echo "------------------------------------------"

    if git diff-index --quiet HEAD --; then
        echo "Opps: No dotfiles changed"
    else
        echo "\n\nCreating a commit of all the dotfiles"
        git add -A && git commit -m "Backup Date: $(date)";
        echo "Yay!! Commit created successfully. Files changed:"

        echo "\\nNew commit - \\n------------------------------------------"
        git show --stat --oneline HEAD | tail
        echo "------------------------------------------"
    fi
}


function CLEANUP_DOCKER() {
    docker system df
    #docker image prune -a
    docker images | grep "none" | tr -s " " | cut -d " " -f 3 | uniq |  while read -r line; do echo -e "Removing > ${line}"; docker rmi -f ${line}; done
    echo  -e "-- CLEAN UP OF DOCKER IMAGES IS DONE --\n\n"

    docker images > /tmp/.docker_image_ids
    # docker container ls -a | tr -s " " | cut -d " " -f2 | while read -r id; do if [ grep ${id} /tmp/.docker_image_ids ];  echo "> ${id}"; done
    # docker container ls -a | tr -s " " | tail +2  | cut -d " " -f2 | while read -r id; do; if [ $(grep -c "${id}" /tmp/.docker_image_ids) -eq 0 ]; then echo "> Removing container - ${id}"; docker container rm "${id}"; fi; done
    docker system df

}


# Mac clean cache
function CLEAN_MAC() {
    sudo /bin/rm -rf /Users/mahendra/Library/Caches 2>/dev/null;
    # sudo /bin/rm -rf /Library/Caches 2>/dev/null;
    # sudo /bin/rm -rf "~/Library/Saved Application State/" 2>/dev/null;
    echo "Done";
}


function MOST_USED_COMMANDS {
    history 0 $HISTSIZE | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
}

########################################################################################################################

# for timing
# zprof

# autoload -U +X bashcompinit && bashcompinit
# complete -o nospace -C /usr/local/bin/terraform terraform
# export PATH="$HOME/.jenv/bin:$PATH"
# eval "$(jenv init -)"
export TALISMAN_INTERACTIVE=true


# complete -o nospace -C /usr/local/bin/vault vault

export PATH="$(brew --prefix gnu-tar)/libexec/gnubin:$(brew --prefix grep)/libexec/gnubin:$(brew --prefix gnu-sed)/libexec/gnubin:$(brew --prefix gnu-indent)/libexec/gnubin:$(brew --prefix findutils)/libexec/gnubin:$(brew --prefix gnu-tar)/libexec/gnubin:$PATH"
export PATH="$(brew --prefix ruby)/bin:$PATH"

# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/mahendra/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/mahendra/opt/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/Users/mahendra/opt/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/mahendra/opt/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<


# export NVM_DIR="$HOME/.nvm"
# [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
#
function path(){
    old=$IFS
    IFS=:
    printf "%s\n" $PATH
    IFS=$old
}

export AIRFLOW_HOME=~/airflow
export MLFLOW_TRACKING_URI=http://localhost:5000
# source ~/miniconda/bin/activate
# source ~/.profile

#source ~/.oh-my-zsh/custom/plugins/k3d/_k3d
#export BYOBU_PREFIX=/usr/local

export GPG_TTY=$(tty)
alias fix-gpg='pkill -9 gpg-agent && export GPG_TTY=$(tty)'

#kube PS prompmt
KUBE_PS1_SYMBOL_USE_IMG=true
source "$(brew --prefix kube-ps1)/share/kube-ps1.sh"
PS1='$(kube_ps1)'$PS1



dnsreset () {
  # sudo networksetup -setdnsservers "USB 10/100/1000 LAN" Empty
  # sudo networksetup -setdnsservers "USB 10/100/1000 LAN" 1.1.1.1 1.0.0.1
  sudo networksetup -setdnsservers "Wi-Fi" Empty
  # sudo networksetup -setdnsservers "Wi-Fi" 8.8.8.8 8.8.4.4
  sudo networksetup -setdnsservers "Wi-Fi" 1.1.1.1 1.0.0.1
  ping google.com
}

# TODO: remove it after installation of rust
# source $HOME/.cargo/env



GET_ALLOW_COPY_JS_CODE() {
    echo 'var allowPaste = function(e){
  e.stopImmediatePropagation();
  return true;
};
document.addEventListener("paste", allowPaste, true);'
}

function RENAME_FILES_RECURSIVELY() {

  SEARCH_PATH="$1"
  SEARCH="$2"
  REPLACE="$3"

  find ${SEARCH_PATH} -type f -name "*${SEARCH}*" | while read FILENAME ; do
      NEW_FILENAME="$(echo ${FILENAME} | sed -e "s/${SEARCH}/${REPLACE}/g")";
      mv "${FILENAME}" "${NEW_FILENAME}";
  done
}


export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
#source /Users/mahendra/.config/broot/launcher/bash/br

export PATH="${PATH}:$(brew --prefix unbound)/sbin"

# Clean metadat from image
# make sure imagemagick (brew install imagemagick) is installed
#convert orig.jpg -strip result.jpg
#or
#mogrify -strip orig.jpg"
alias clean_image_metadata='mogrify -strip '

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mahendra/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mahendra/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mahendra/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mahendra/google-cloud-sdk/completion.zsh.inc'; fi

# bun completions
[ -s "/Users/mahendra/.bun/_bun" ] && source "/Users/mahendra/.bun/_bun"


# # syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

# export ZPLUG_HOME=$(brew --prefix zplug)
# source $ZPLUG_HOME/init.zsh
#
#. ~/.asdf/plugins/java/set-java-home.zsh
#export JAVA_HOME='/Library/Java/JavaVirtualMachines/temurin-8.jdk/Contents/Home'
#export PATH='${PATH}:/Library/Java/JavaVirtualMachines/temurin-8.jdk/Contents/Home'

#autoload -U +X bashcompinit && bashcompinit
#source /usr/local/etc/bash_completion.d/az

# resolve librdkafka missing issue
export C_INCLUDE_PATH=$(brew --prefix)/include
export LIBRARY_PATH=$(brew --prefix)/lib

# Activate asdf
#. $HOME/.asdf/asdf.sh # m1
. /usr/local/opt/asdf/libexec/asdf.sh #intel

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

# openssl path setup
# export LDFLAGS="-L$(brew --prefix openssl@3)/lib"
# export CPPFLAGS="-I$(brew --prefix openssl@3)/include"
# export PATH="$(brew --prefix openssl@3)/bin:$PATH"

# useful only for Mac OS Silicon M1,
# still working but useless for the other platforms
# docker {
#  if [[ `uname -m` == "arm64" ]] && [[ "$1" == "run" || "$1" == "build" ]]; then
#     `which docker` "$1" --platform linux/amd64 "${@:2}"
#   else
#       `which docker` "$@"
#   fi
# }

export CPPFLAGS="-I/usr/local/include -L/usr/local/lib"
export LDFLAGS="-L$(brew --prefix libffi)/lib"
export CPPFLAGS="-I$(brew --prefix libffi)/include"

alias colima_start='colima start --cpu 4 --memory 8 --disk 20'
export PATH=${PATH}:${HOME}/.mitmproxy/bin


start_colima() {
  local CERTS="${HOME}/.ca-certificates"
  mkdir -p ${CERTS}
  openssl s_client -showcerts -connect ${URL} </dev/null 2>/dev/null|openssl x509 -outform PEM >${CERTS}/docker-com.pem
  openssl s_client -showcerts -verify 5 -connect ${URL} </dev/null 2>/dev/null | sed -ne '/-BEGIN/,/-END/p' >${CERTS}/docker-com-chain.pem
  colima start

  colima ssh -- sudo cp ${CERTS}/* /usr/local/share/ca-certificates/
  colima ssh -- sudo update-ca-certificates
  colima ssh -- sudo service docker restart
}

export M2_HOME="/Users/mahendra/apache-maven-3.8.7"
PATH="${M2_HOME}/bin:${PATH}"
export PATH
alias icloud='cd "/Users/mahendra/Library/Mobile Documents/com~apple~CloudDocs/"'
export PATH=${PATH}:${HOME}/.mitmproxy/bin
export PATH=${PATH}:${HOME}/.mitmproxy/bin


# Enable touch id for sudo
# Start
if grep -q 'auth sufficient pam_tid.so' /etc/pam.d/sudo; then
  echo "Touch ID is enabled for sudo"
else
  read "response?Touch ID is not enabled for sudo. Would you like to enable it now? [y/n]: "
  if [[ "$response" == [yY] ]]; then
    sudo grep -q -F 'auth sufficient pam_tid.so' /etc/pam.d/sudo || sudo sed -i '' '2i\
auth sufficient pam_tid.so
    ' /etc/pam.d/sudo
    if grep -q 'auth sufficient pam_tid.so' /etc/pam.d/sudo; then
      echo "'auth sufficient pam_tid.so' added to /etc/pam.d/sudo"
    fi
  else
    echo "No modifications were made to /etc/pam.d/sudo"
  fi
fi
# End

