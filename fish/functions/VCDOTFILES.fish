function VSDOTFILES
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
    fi;
end
