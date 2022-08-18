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
