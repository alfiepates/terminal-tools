#!/bin/bash
# alfiepates 2015
# license: CC0 1.0
# wavto16bit.sh
# this script converts a directory of wav files to 16-bit wav, and ignores other files.
# usage:
# sh ./wavto16bit.sh

mkdir -p wavto16bit
for file in *.wav; do
    ffmpeg -i "$file" -acodec pcm_s16le "wavto16bit/$file"
done
