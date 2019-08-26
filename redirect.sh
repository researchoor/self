#!/bin/bash

rm -f redirects/$1.html
cat <<EOF >> redirects/$1.html
---
redirect_from: /$1
---
<meta http-equiv='refresh' content='0; url=$2'>
EOF
git add -q redirects/$1.html
git commit -q -m "$1 -> $2"
git push
