#for dir in /1/apps; do
#    echo "$dir"
#done

for dir in /1/apps/; do
    [ -d "$dir" ] && echo "$dir"
done

