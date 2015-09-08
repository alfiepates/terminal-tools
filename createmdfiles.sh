#!/bin/bash
# alfiepates 2015
# license: CC0 1.0
# createmdfiles.sh
# this script creates markdown files from each line in the file $1.

file=$1
echo creating markdown files from $1
while read p; do
    touch ${p}.md
    echo created ${p}.md
done < $file
echo done
