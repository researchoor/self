#!/bin/bash

rm -f $1.html
echo "<meta http-equiv='refresh' content='0; url=$2'>" >> $1.html
git add $.html
git commit -m "$1 -> $2"
git push
