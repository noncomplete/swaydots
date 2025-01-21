#!/usr/bin/env bash

for file in *.webm; do
  echo -e "processing file...$file";
  ffmpeg -i "${file}" -vn -ab 128k -ar 48000 -y "${file%.webm}.mp3";
done;
