#!/bin/sh

srclst="hostssources.lst"
#touch "$srclst"

if [ -f hosts ] ; then
	cat hosts >> "$srclst"
fi

curl -L "https://adaway.org/hosts.txt" >> "$srclst"
curl -L "https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&showintro=0&mimetype=plaintext" >> "$srclst"
curl -L "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts" >> "$srclst"
curl -L "http://winhelp2002.mvps.org/hosts.txt" >> "$srclst"

# For blocking youtube flash ads, if you face any issues loading videos just remove this line
echo "127.0.0.1       s.ytimg.com" >> "$srclst"

sudo cp "$srclst" /etc/hosts

echo "'hosts' file has been updated successfully..."
rm "$srclst"
