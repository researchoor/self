#!/bin/bash

rm -f _links/$1.html
cat <<EOF >> _links/$1.html
---
redirect_from: /$1
redirect_to: $2
category: ${3:?}
---
EOF
git add _links/$1.html
git commit -q -m "$1 -> $2"
git push -q
git push -q gitlab master
