#!/bin/bash

if ! command -v wget &> /dev/null; then
  echo "Wget cannot be found"
  exit 1
fi

for app in axiom ief; do
  CURRENT=$(wget --spider https://magnetforensics.com/dl/${app} 2>&1 | egrep -o "^Adress: .*" | cut -d" " -f2 | rev | cut -d"/" -f1 | rev)

  if [ ! -f ${CURRENT} ]; then
	wget -q -O "${CURRENT}" https://magnetforensics.com/dl/${app}
  fi
done
