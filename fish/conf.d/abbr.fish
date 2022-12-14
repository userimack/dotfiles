# basic utils
abbr rm "rm -i"
abbr cp "cp -iv"
abbr mv "mv -i"
abbr rm 'rm -iv'


# prevents accidentally clobbering files
abbr mkdir "mkdir -p"
abbr h "history"
abbr which "type -a"

# pretty-print of some PATH variables
abbr path 'echo -e ${PATH//:/\\n}'
abbr libpath 'echo -e ${LD_LIBRARY_PATH//:/\\n}'

# git related aliases
abbr gl 'git log --graph --oneline --decorate --all'
abbr gs 'git status -sb'
abbr gshow 'git show --name-only --oneline HEAD'
abbr gshowf 'git show --oneline'


abbr myip 'ipconfig getifaddr en1 || ipconfig getifaddr en0'

abbr dif 'diff --side-by-side --suppress-common-lines'
abbr named 'find . -name'
abbr ql 'qlmanage -p 2>/dev/null'


# #alias -g b64='| base64'
# #alias -g b64d='| base64 -D'
# # usage - echo "test" b64 and echo "dGVzdAo=" b64d

# it helps in traversing files in different branches
# Like: git show branch_name:/path/to/file.py | vim.py
abbr vim.py "vim - -c 'set syntax=python'"

# vim configs
abbr vim 'nvim'
abbr vi 'nvim'
abbr vimdiff "nvim -d"

abbr d 'deactivate'
abbr exa "exa -abghl --git"
#abbr ls "exa -lag --header"

abbr l 'ls -lhtr'
abbr ll 'ls -lhSr'  # -l = list , -h = human readable sizes, -S = Sort descending, -r = reverse sorting
# alias server='echo "Starting server on $(ifconfig | grep "inet\ 192" | cut -d" " -f2):8000"; python2.7 -m SimpleHTTPServer'
abbr server 'echo "Starting server on http://$(ipconfig getifaddr en1 || ipconfig getifaddr en0):8000"; python3 -m http.server'

# using xc command whatever you pipe to it, it will print and copy the same to clipboard
# alias xc='tee /dev/tty|xclip -selection clipboard'



# removing rm command and using trash command
# alias rm "echo Use 'trash', or the full path i.e. '/bin/rm'"
abbr tmux 'tmux -u'

abbr pmr 'python manage.py runserver'

# chrome setup
abbr chrome "/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

# ipython aliases
abbr ipython3 'ipython3 --TerminalInteractiveShell.editing_mode=vi'
abbr ipython 'ipython --TerminalInteractiveShell.editing_mode=vi'
abbr ip 'ipython'

# pytest with coverage
abbr pycov 'pytest -sv --cov-report term-missing --cov=. '

abbr ydl 'youtube-dl'
abbr say 'say -v Samantha'

abbr find_dir_chmod 'find . -type d -exec chmod 744 {} \;'
abbr find_file_chmod 'find . -type f -exec chmod 644 {} \;'
abbr find_dup 'gfind . ! -empty -type f -exec md5sum {} + 2>/dev/null | sort | guniq -w32 -dD '



# Add the following to .zshrc/.bashrc...etc
# Allows setting default namespace while working with kubectl #

abbr k 'kubectl'
abbr kcc 'kubectl config current-context'
abbr kgc 'kubectl config get-contexts'
abbr kge 'kubectl get events --sort-by='\''{.lastTimestamp}'\'
abbr kgp 'kubectl get pods'
abbr kl 'kubectl logs '
abbr kpf 'kubectl port-forward'
abbr ksc 'kubectl config use-context'

abbr knl "kubectl config get-contexts"
abbr kn 'kubectl config set-context --current --namespace '
# kn default

#Usage:
#➜  ~ ksn dev1                                                       (dev-context/dev1)
#     Context "dev-context" modified.
#     Namespace: dev1

#➜  ~ ksn ff                                                         (dev-context/dev1)
#     Error from server (NotFound): namespaces "ff" not found

abbr cat 'bat'

abbr tf 'terraform'

abbr pp 'jq -C . | less -FX'
#cat foo.json | pp

abbr dfimage "docker run -v /var/run/docker.sock:/var/run/docker.sock --rm alpine/dfimage"

#function dih {docker history --no-trunc $argv  | tac | tr -s ' ' | cut -d " " -f 5- | sed 's,^/bin/sh -c #(nop) ,,g' | sed 's,^/bin/sh -c,RUN,g' | sed 's, && ,\n  & ,g' | sed 's,\s*[0-9]*[\.]*[0-9]*\s*[kMG]*B\s*$,,g' | head -n -1}
#

# install required: brew install lsd
abbr ls 'lsd'
abbr l 'ls -l'
abbr la 'ls -a'
abbr lla 'ls -la'
abbr lt 'ls --tree'

abbr du 'dust'
abbr df 'duf'
abbr curl 'curlie'


abbr gp_stop 'launchctl unload /Library/LaunchAgents/com.paloaltonetworks.gp.pangp*'
abbr gp_start 'launchctl load /Library/LaunchAgents/com.paloaltonetworks.gp.pangp*'

abbr gp_restart 'launchctl unload /Library/LaunchAgents/com.paloaltonetworks.gp.pangp* && launchctl load /Library/LaunchAgents/com.paloaltonetworks.gp.pangp*'

abbr mplayer 'vlc -Idummy'

# nix alias
abbr nix-env-search 'nix-env -qaP'
abbr nix-env-install 'nix-env -iA'
abbr nix-env-update-all 'nix-channel --update nixpkgs && nix-env -u "*"'
abbr nix-up 'nix-env -u'
abbr nix-gc 'nix-collect-garbage -d'

abbr docker 'podman'
