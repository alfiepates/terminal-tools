#!/bin/bash
# alfiepates 2015
# license: CC0 1.0
# createimgdir.sh
# this script creates "img" directories for a folder of markdown (.md) files, ignoring other files.
# usage:
# sh ./createimgdir.sh

mkdir -p img
for file in $( ls ); do
  if [ ${file: -3} == ".md" ]; then
    mkdir ./img/`basename $file .md`
    echo created ./img/`basename $file .md`
  fi
done
