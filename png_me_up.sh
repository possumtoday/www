#!/bin/sh
set -ex

for file in *; do
	if \
			! printf "%s\n" "$file" | grep "\.png*" >/dev/null 2>&1 \
			&& ! test -e "$(printf "%s\n" "$file" | cut -d . -f 1).png"
		then
		[ "$(printf "%s\n" "$file" | cut -d . -f 2)" = jpg ] \
			&& convert "$file" "$(printf "%s\n" "$file" | cut -d . -f 1).png"
		fi
done
