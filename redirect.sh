#!/bin/bash

rm -f collections/_links/$1.html
cat <<EOF >> collections/_links/$1.html
---
redirect_from: /$1
redirect_to: $2
category: ${3:?}
---
EOF
git add collections/_links/$1.html
git commit -q -m "$1 -> $2"
git push -q
