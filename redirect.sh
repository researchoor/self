#!/bin/bash

rm -f redirects/$1.html
cat <<EOF >> redirects/$1.html
---
redirect_from: /$1
redirect_to: $2
---
EOF
git add redirects/$1.html
git commit -q -m "$1 -> $2"
git push -q
