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

if [ "$appsempty" = "0" ]; then
for dir in /1/apps/*/; do
    [ -d "$dir" ] && if [ -f "$dir"/appmanifest.json ]; then listitemname="$(echo "$dir" | cut -d/ -f4)" && echo "$listitemname"; fi && contents="$(jq ".apps[].\"$listitemname\" = \"$dir\"" list.json)" && \
    echo "${contents}" > list.json
#https://askubuntu.com/a/749646
done
#https://unix.stackexchange.com/a/611577
fi
