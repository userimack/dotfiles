# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

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
  git
  kubectl
  docker
  virtualenvwrapper
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


export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# function to go latest chnaged directory
function ol ()
{
    latest_dir=$(ls -tr | tail -1);
    echo "cding into $latest_dir";
    cd "$latest_dir"
}

function sudo(){
    cat ~/.sudoers.lecture
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
alias gc='git commit -am'
alias gl='git log --graph --oneline --decorate --all'
alias gs='git status -sb'

# web services
alias weather='curl -s wttr.in/Hyderabad | head -7'
alias weatherforecast='curl -s wttr.in/Hyderabad | head -37 | tail -30'
qrcode() {
    echo $@ | curl -F-=\<- qrenco.de
}


#-------------------------------------------------------------
# zsh options
#-------------------------------------------------------------

# syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

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


zstyle ':completion:*' menu select


#-------------------------------------------------------------
# aliases
#-------------------------------------------------------------
alias d='deactivate'
alias exa="exa -abghl --git"
alias l='ls -lhtr'
alias ll='ls -lhSr'  # -l = list , -h = human readable sizes, -S = Sort descending, -r = reverse sorting
# alias server='echo "Starting server on $(ifconfig | grep "inet\ 192" | cut -d" " -f2):8000"; python2.7 -m SimpleHTTPServer'
alias server='echo "Starting server on $(ifconfig | grep "inet\ 192" | cut -d" " -f2):8000"; python -m http.server'

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
alias rm="echo Use 'trash', or the full path i.e. '/bin/rm'"
alias tmux='tmux -u'

alias ipython3='ipython3 --TerminalInteractiveShell.editing_mode=vi'
alias ipython='ipython --TerminalInteractiveShell.editing_mode=vi'
alias ip='ipython'


# autojump configuration
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# rust config
source $HOME/.cargo/env

# Go development
export GOPATH="${HOME}/go"
export GOBIN="${HOME}/go/bin"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin:$HOME/bin"

# iterm 2 shell integration config
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PROTOC="${HOME}/.protoc"
export PATH="$PATH:${PROTOC}/bin"

alias notes='echo "python -m grpc_tools.protoc -I. --python_out=. --grpc_python_out=. <proto_file>.proto"'


# source zsh_profile
source ~/.zsh_profile
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"


export PATH="/usr/local/opt/gettext/bin:$PATH"

export ANDROID_NDK_HOME=/usr/local/share/android-ndk

# fzf settings https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# key bindings
# bindkey "\e[1~" beginning-of-line
# bindkey "\e[4~" end-of-line

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mahendra/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/mahendra/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mahendra/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/mahendra/google-cloud-sdk/completion.zsh.inc'; fi


# android configs
export PATH=${PATH}:${HOME}/flutter/bin

# vim configs
alias vim='nvim'
alias vi='nvim'

# Python virtual environments:
export VIRTUALENVWRAPPER_PYTHON=`which python3`
export WORKON_HOME=$HOME/.virtualenvs
#export WORKON_HOME=/tmp/foo/.virtualenvs
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
if [[ -r /usr/local/bin/virtualenvwrapper.sh ]]; then
    source /usr/local/bin/virtualenvwrapper.sh
else
    echo "WARNING: Can't find virtualenvwrapper.sh"
fi
