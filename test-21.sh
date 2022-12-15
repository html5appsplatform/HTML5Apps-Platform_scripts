#if [ "$(jq -r '.apps' list.json)" = "null" ] || [ "$(jq -r '.apps' list.json)" = "" ]; then
#   echo "Its your first time using $(basename "$0")!"
##https://stackoverflow.com/a/192337/5623661
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
#https://askubuntu.com/a/749646
    contents="$(jq ".apps[].\"$listitemname\" = \"$dir\"" list.json)" && \
    echo "${contents}" > list.json
done
#https://unix.stackexchange.com/a/611577

#for dir in /1/games/*/; do
##use later    [ -d "$dir" ] && if [ -f "$dir"/appmanifest.json ]; then echo "$dir" | cut -d/ -f4; fi
#    [ -d "$dir" ] && listitemname="$(echo "$dir" | cut -d/ -f4)" && echo "$listitemname"
##https://askubuntu.com/a/749646
#    contents="$(jq ".games[].\"$listitemname\" = \"$dir\"" list.json)" && \
#    echo "${contents}" > list.json
#done
#if empty, it gets $dir from the last from /1/apps
##https://unix.stackexchange.com/a/611577
