# :.bashrc
# xrandr --output VGA-1-2 --off

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export PS1="\W \`parse_git_branch\` $ "

#export PS1='\W $ '
# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

export TERM=screen-256color

#-------------------------------------------------------------
# aliases
#-------------------------------------------------------------
alias d='deactivate'
alias l='ls -lhtr'
alias ll='ls -lhSr'  # -l = list , -h = human readable sizes, -S = Sort descending, -r = reverse sorting
alias update='sudo apt-get update && sudo apt-get upgrade -y'
alias server='python -m SimpleHTTPServer'

alias soapui='/opt/SoapUI-5.3.0/bin/soapui.sh'

alias fm='xdg-open .'
alias zipping='echo -ne "Compress Method <gz>: $ tar  -cvzf  name_of_the_archive.tar.gz <files>\nExtract_Method <gz>: tar -xzvf archive.tar.gz # -C /home # to Extract in a specific directory\nCompress_Method <bz2>: tar -cjvf name_of_the_archive.tar.bz2 <files>\nExtract_Method <bz2>: tar -xjvf archive.tar.bz2\n"'

alias xc='tee /dev/tty|xclip --selection clipboard'
set -o vi

# ls
export COLUMNS  # Remember columns for subprocesses.
eval "$(dircolors)"
function ls {
	command ls -F -h --color=always -v --author --time-style=long-iso -C "$@" | less -R -X -F
}
# alias ll='ls -l'
# alias l='ls -l -a'

# powerline test
alias testpl='echo "\ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699"'

# basic utils
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'

# prevents accidentally clobbering files
alias mkdir='mkdir -p'



# extract archives
function ex()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

function duone()
{
    du -k --max-depth 1 $1 | sort -n
}

function dutwo()
{
    du -hs * |sort -h -r
}

#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. /usr/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

export PATH=$HOME/bin:$PATH

export Path=/opt/android-studio/bin
export WORKON_HOME=~/.virtualenvs
. /usr/local/bin/virtualenvwrapper.sh

export SPARK_HOME=/home/mahendra/spark-2.1.0-bin-hadoop2.7
export PATH=$PATH:$SPARK_HOME/bin

export VISUAL=vim
export EDITOR="$VISUAL"

source /usr/share/autojump/autojump.sh
alias vim=nvim

export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

alias rm="echo Use 'trash', or the full path i.e. '/bin/rm'"
alias tmux='tmux -u'
