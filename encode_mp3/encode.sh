#!/bin/sh

i=0
source encode.txt

while [ $i != $TRACKS ]; do
    let i+=1;
    TRACK_NR=`printf "%02d" $i`
    TITLE=${TRACK[$i]}

    lame -h --add-id3v2 --ta "$ARTIST" --tl "$ALBUM" --tn $TRACK_NR --tt "$TITLE" --ty "$DATE" track$TRACK_NR.cdda.wav "$ARTIST - $ALBUM - $TRACK_NR - $TITLE.mp3"
done
