#!/bin/sh
set -ex

_convert(){
	convert "$1" "$(printf "%s\n" "$1" | cut -d . -f 1).$2"
}

for file in *; do
	if \
			! printf "%s\n" "$file" | grep "\.png*" >/dev/null 2>&1 \
			&& ! test -e "$(printf "%s\n" "$file" | cut -d . -f 1).png"
		then
		case "$(printf "%s\n" "$file" | cut -d . -f 2)" in
		jpg) _convert "$file" png ;;
		webp) _convert "$file" png ;;
		esac
	fi
done
