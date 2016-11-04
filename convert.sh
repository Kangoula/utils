#/bin/sh
find . -type f -name '*.mp3' -exec bash -c 'ffmpeg -i "$0" -map a -c:a libvorbis -q:a 7 "${0/%mp3/ogg}"' '{}' \;
