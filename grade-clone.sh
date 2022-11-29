#!/bin/sh

if [ "$#" -ne 2 ] || ! [ -f "$1" ]; then
	echo "Usage: $0 grades.csv url_prefix" >&2
	exit 1
fi

CSVFILE="$1"
URLPREFIX="$2"

cat $CSVFILE | while IFS="," read -r $(seq -f 'col%0.f' -s ' ' 1 10)
do
	echo "$URLPREFIX/$col6" | tr -d '"' | xargs git clone
done
