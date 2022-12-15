for dir in /1/apps/*/; do
#use later    [ -d "$dir" ] && if [ -f "$dir"/appmanifest.json ]; then echo "$dir" | cut -d/ -f4; fi
    [ -d "$dir" ] && echo "$dir" | cut -d/ -f4
done

#/1/games
