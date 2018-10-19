#!/bin/sh

filemap()
{
    while read line
    do
        painText=`echo "$line" | tr -d [:blank:]`
        test -z "$painText" && continue
        $1 "$painText"
    done < $2
}

passwdGenerate()
{
    user=`echo "$1" | cut -d ":" -f 1`
    passwd=`echo "$1" | cut -d ":" -f 2`
    echo "$user l2tpd $passwd *"
}

filemap passwdGenerate $1

echo "l2tp: /etc/ppp/chap-secrets" 1>&2
