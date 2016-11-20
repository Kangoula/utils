#/bin/bash

function convert {
    echo $2
    ffmpeg -i "${2}" -map a -c:a libvorbis -q:a 7 "${2/%$1/ogg}"
}

function main {
    TYPE=${1}
    for file in *.$TYPE
    do
        convert $TYPE "$file"
    done

}

main ${1}
