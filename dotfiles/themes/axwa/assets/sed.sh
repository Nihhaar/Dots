#!/bin/sh
sed -i \
         -e 's/#1A2126/rgb(0%,0%,0%)/g' \
         -e 's/#A7CEC8/rgb(100%,100%,100%)/g' \
    -e 's/#0d1116/rgb(50%,0%,0%)/g' \
     -e 's/#4BC6B9/rgb(0%,50%,0%)/g' \
     -e 's/#ffffff/rgb(50%,0%,50%)/g' \
     -e 's/#1a1a1a/rgb(0%,0%,50%)/g' \
	$@
