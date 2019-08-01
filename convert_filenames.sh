#!/bin/bash

set -euo pipefail

find . -iname metadata.tsv | \
		while read -r file; do
				newDir="$(dirname "$file")"
				echo "Creating Script in ""$newDir"
				pushd "$newDir" || exit
				awk -v FS='\t' -v OFS='\t' \
						'{print "rename", $1, $19 "_" $10 "_" $12 "_rep" $31, $1 "*"}' \
						"$(basename "$file")" \
						| tail -n+2 \
						| sed -e 's/-/_/g' -e 's/ /_/g' -e 's/\t/ /g' -e 's/___/_control_/g'\
									> replace.sh
				bash replace.sh
				popd
		done
