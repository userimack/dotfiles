#[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export PATH="$PATH:/Users/mahendra/flutter-projects/develop-environment/flutter/bin"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

complete -C /usr/local/bin/terraform terraform

complete -C /usr/local/bin/vault vault


export HISTTIMEFORMAT="%d/%m/%y %T "
. "$HOME/.cargo/env"

source /Users/mahendra/.config/broot/launcher/bash/br

complete -C /usr/local/Cellar/tfenv/2.2.3/versions/0.13.6/terraform terraform

alias docker='podman'

# useful only for Mac OS Silicon M1,
# still working but useless for the other platforms
docker() {
 if [[ `uname -m` == "arm64" ]] && [[ "$1" == "run" || "$1" == "build" ]]; then
    /usr/local/bin/docker "$1" --platform linux/amd64 "${@:2}"
  else
     /usr/local/bin/docker "$@"
  fi
}
