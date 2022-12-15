#if [ "$(jq -r '.apps' list.json)" = "null" ] || [ "$(jq -r '.apps' list.json)" = "" ]; then
#   echo "Its your first time using $(basename "$0")!"
#   echo "Initializing..."
#   cat > list.json << ENDOFFILE
#{
#	"apps": {},
#	"games": {}
#}
#ENDOFFILE
#fi

if [ -f list.json ]; then rm list.json; fi
if [ ! -f list.json ]; then
   cat > list.json << ENDOFFILE
{
	"apps": [{}],
	"games": [{}]
}
ENDOFFILE
fi

for dir in /1/apps/*/; do
#use later    [ -d "$dir" ] && if [ -f "$dir"/appmanifest.json ]; then echo "$dir" | cut -d/ -f4; fi
    [ -d "$dir" ] && listitemname="$(echo "$dir" | cut -d/ -f4)" && echo "$listitemname"
    contents="$(jq ".apps[].\"$listitemname\" = \"$dir\"" list.json)" && \
    echo "${contents}" > list.json
done

#for dir in /1/games/*/; do
##use later    [ -d "$dir" ] && if [ -f "$dir"/appmanifest.json ]; then echo "$dir" | cut -d/ -f4; fi
#    [ -d "$dir" ] && listitemname="$(echo "$dir" | cut -d/ -f4)" && echo "$listitemname"
#    contents="$(jq ".games[].\"$listitemname\" = \"$dir\"" list.json)" && \
#    echo "${contents}" > list.json
#done
#if empty, it gets $dir from the last from /1/apps
