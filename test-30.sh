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

[ "$(ls -A /1/apps)" ] && appsempty="0" || appsempty="1"
[ "$(ls -A /1/games)" ] && gamesempty="0" || gamesempty="1"
#https://www.cyberciti.biz/faq/linux-unix-shell-check-if-directory-empty/

echo "Listing HTML5 apps..."
if [ "$appsempty" = "0" ]; then
for dir in /1/apps/*/; do
    [ -d "$dir" ] && if [ -f "$dir"/appmanifest.json ]; then echo "----------"; listitemname="$(echo "$dir" | cut -d/ -f4)" && echo "$listitemname"; listitemdir="$(echo "$dir")" && echo "$listitemdir"; echo "----------"; contents="$(jq ".apps[].\"$listitemname\" = \"$listitemdir\"" list.json)" && \
    echo "${contents}" > list.json; fi
#https://askubuntu.com/a/749646
done
#https://unix.stackexchange.com/a/611577
fi

echo "Listing HTML5 games..."
if [ "$gamesempty" = "0" ]; then
for dir in /1/games/*/; do
    [ -d "$dir" ] && if [ -f "$dir"/appmanifest.json ]; then echo "----------"; listitemname="$(echo "$dir" | cut -d/ -f4)" && echo "$listitemname"; listitemdir="$(echo "$dir")" && echo "$listitemdir"; echo "----------"; contents="$(jq ".games[].\"$listitemname\" = \"$listitemdir\"" list.json)" && \
    echo "${contents}" > list.json; fi
#https://askubuntu.com/a/749646
done
#https://unix.stackexchange.com/a/611577
fi
