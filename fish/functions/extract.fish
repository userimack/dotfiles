function extract
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
end

