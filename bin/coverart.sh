#!/bin/bash

DEFAULT_COVER="/home/gabriel/gfx/pics/def-cover.png"

#MUSICDIR=`cat /etc/mpd.conf | grep -v "#" | grep music_directory | sed 's/"//g;s/ /\\ /g'`
MUSICDIR=/mnt/music/
MUSICDIR=${MUSICDIR:16}
MUSICDIR=${MUSICDIR%/$}

MFILE=`mocp -Q %file`
MFILE=${MFILE%/*}
MFILE=${MFILE%/$}

FULLDIR="$MUSICDIR/$MFILE"

COVERS=`ls "$FULLDIR" | grep -i "\.jpg\|\.png\|\.gif"`

if [ -z "$COVERS" ]; then
	COVERS="$DEFAULT_COVER"
else
	TRYCOVERS=`echo "$COVERS" | grep "cover[^_back]\|front" | head -n 1`

	if [ -z "$TRYCOVERS" ]; then
		TRYCOVERS=`echo "$COVERS" | head -n 1`
		if [ -z "$TRYCOVERS" ]; then
			TRYCOVERS="$DEFAULT_COVER"
		else
			TRYCOVERS="$FULLDIR/$TRYCOVERS"
		fi
	else
		TRYCOVERS="$FULLDIR/$TRYCOVERS"
	fi

	COVERS="$TRYCOVERS"
fi

echo -n "$COVERS"
