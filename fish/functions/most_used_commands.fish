function most_used_commands
    history 0 $HISTSIZE | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
end
