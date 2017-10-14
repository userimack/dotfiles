## Welcome text
#figlet Mahendra


# echo "Welcome Mahendra :) Have a Good day"

# ------------------------------------------------------------
#    Imported from  https://github.com/brianclemens/dotfiles
#------------------------------------------------------------
#-------------------------------------------------------------
# options
#-------------------------------------------------------------

# make
export MAKEFLAGS="$MAKEFLAGS -j$(($(nproc)))"

# colours
source ~/.config/nvim/plugged/gruvbox/gruvbox_256palette.sh

# man page colours
export LESS_TERMCAP_mb=$'\e[0;31m'
export LESS_TERMCAP_md=$'\e[0;34m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[0;34;36m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[0;35m'

#-------------------------------------------------------------
# aliases
#-------------------------------------------------------------

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

# ls
export COLUMNS  # Remember columns for subprocesses.
eval "$(dircolors)"
function ls {
	command ls -F -h --color=always -v --author --time-style=long-iso -C "$@" | less -R -X -F
}

# powerline test
alias testpl='echo "\ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699"'

# basic utils
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'

# prevents accidentally clobbering files
alias mkdir='mkdir -p'

# pretty-print of some PATH variables
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'

# Privacy
alias qutebrowser='qutebrowser --backend webengine'
alias chromium='chromium --disk-cache-dir=/tmp/cache'

alias vi='nvim'; alias vim='nvim'
alias vimdiff='nvim -d'

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

# vim mode
#bindkey -v
set -o vi

# syntax highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
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
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_IGNORE_DUPS


zstyle ':completion:*' menu select

#### Previous Configuration ####

#-------------------------------------------------------------
# aliases
#-------------------------------------------------------------
alias d='deactivate'
alias l='ls -lhtr'
alias ll='ls -lhSr'  # -l = list , -h = human readable sizes, -S = Sort descending, -r = reverse sorting
alias server='python -m SimpleHTTPServer'

alias soapui='/opt/SoapUI-5.3.0/bin/soapui.sh'

alias fm='xdg-open .'
alias zipping='echo -ne "Compress Method <gz>: $ tar  -cvzf  name_of_the_archive.tar.gz <files>\nExtract_Method <gz>: tar -xzvf archive.tar.gz # -C /home # to Extract in a specific directory\nCompress_Method <bz2>: tar -cjvf name_of_the_archive.tar.bz2 <files>\nExtract_Method <bz2>: tar -xjvf archive.tar.bz2\n"'

alias xc='tee /dev/tty|xclip -selection clipboard'
set -o vi


# Functions duone and dutwo are to get size of each file in the directory#
function duone()
{
    du -k --max-depth 1 $1 | sort -n
}

function dutwo()
{
    du -hs * |sort -h -r
}

export PATH=$HOME/bin:$PATH

export Path=/opt/android-studio/bin
export WORKON_HOME=~/.virtualenvs
. /usr/local/bin/virtualenvwrapper.sh

export VISUAL=vim
export EDITOR="$VISUAL"

# Autojump configuration##
source /usr/share/autojump/autojump.sh
alias vim=nvim

export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

alias rm="echo Use 'trash', or the full path i.e. '/bin/rm'"
alias tmux='tmux -u'


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/mahendra/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

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
DISABLE_LS_COLORS="true"

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

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


function sudo(){
    cat ~/sudoers.lecture
    # echo 'Ctrl + c to cancel'
    # read
    /usr/bin/sudo $@
}

alias psql='psql grn_static_master'
alias update='sudo apt update -y && sudo apt full-upgrade -y'
alias ipython3='ipython3 --TerminalInteractiveShell.editing_mode=vi'
alias ipython='ipython --TerminalInteractiveShell.editing_mode=vi'

# Changing Caps_lock key to ESC
#xmodmap -e "clear lock" #disable caps lock switch
#xmodmap -e "keysym Caps_Lock = Escape" #set caps_lock as escape
setxkbmap -layout us -option caps:escape

# change xdg-open to ranger
# alias xdg-open='ranger'

export ERL_AFLAGS="-kernel shell_history enabled"
export AIRFLOW_HOME=~/app_airflow
export AIRFLOW_HOME=/home/mahendra/pyconf/app_airflow
#alias run_airflow='airflow webserver -p 8080'
