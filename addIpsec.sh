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
    echo "$user:`openssl passwd -1 "$passwd"`:xauth-psk"
}

filemap passwdGenerate $1

echo "ipsec: /etc/ipsec.d/passwd" 1>&2


