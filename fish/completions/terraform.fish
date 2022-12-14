
function __complete_terraform
    set -lx COMP_LINE (string join ' ' (commandline -o))
    test (commandline -ct) = ""
    and set COMP_LINE "$COMP_LINE "
    /usr/local/Cellar/tfenv/2.2.3/versions/0.13.6/terraform
end
complete -c terraform -a "(__complete_terraform)"

