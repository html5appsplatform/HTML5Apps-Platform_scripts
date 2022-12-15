for dir in /1/apps/*/; do
    [ -d "$dir" ] && if [ -f "$dir"/appmanifest.json ]; then echo "$dir" | cut -d/ -f4; fi
done

