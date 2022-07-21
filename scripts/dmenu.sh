#!/usr/bin/env bash

clear

echo "Editando dmenu_run..."
sleep 1s
cat >> '/usr/local/bin/dmenu_run' << EOF
LANG="pt_BR.UTF-8"
EOF

