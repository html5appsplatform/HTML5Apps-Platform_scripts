for dir in /1/apps/*/; do
    [ -d "$dir" ] && echo "$dir" | cut -d/ -f4
done

