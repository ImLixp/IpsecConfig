month=`date "+%b"`
day=`date "+%d"`
i=0
while true
do
    let i++
    if [ $i -gt $day ]; then
        break
    fi
    echo --------------------[ $month $i ]--------------------
    ./search.sh | grep "$month \\+$i " | tr -s ' ' | cut -d ' ' -f 7 | sort -u
    ./search.sh | grep "$month \\+$i " | tr -s ' ' | cut -d ' ' -f 7 | sort -u | wc -l
done

echo --------------------[ Total ]--------------------
./search.sh | tr -s ' ' | cut -d ' ' -f 7 | sort -u | wc -l
