for dir in /1/apps/*/; do
#use later    [ -d "$dir" ] && if [ -f "$dir"/appmanifest.json ]; then echo "$dir" | cut -d/ -f4; fi
    [ -d "$dir" ] && echo "$dir" | cut -d/ -f4
done

if [ "$(jq -r '.apps' list.json)" = "null" ] || [ "$(jq -r '.apps' list.json)" = "" ]; then
   echo "Its your first time using $(me=`basename "$0"`)!"
   echo "Initializing..."
   cat > list.json << ENDOFFILE
{
	"apps": [{}],
	"games": [{}]
}
ENDOFFILE
fi

#/1/games
