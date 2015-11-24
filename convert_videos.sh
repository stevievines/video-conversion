#!/bin/bash

# originally found here http://marcoghislanzoni.com/blog/2012/05/15/solved-how-to-properly-convert-jvc-mod-files-to-mp4-on-mac/
# NOTE: this assumes that there are no files or directories with spaces.
#  use rename (installed via homebrew) to ensure: `find . -depth -name "* *" -execdir rename 's/ /_/g' "{}" \;`

MOD=MOD
MP4=mp4

for f in `find . -iname '*.mod'`; do
  dest=${f%.$MOD}.$MP4
  echo Converting "$f" to $dest...
  `ffmpeg -loglevel panic -i "$f" -vcodec mpeg4 -b 2300k -deinterlace -aspect 16:9 -acodec aac -strict -2 -ab 192k -ar 44100 "$dest"`
  ddate=`GetFileInfo -d "$f"`
  mdate=`GetFileInfo -m "$f"`
  echo Touching converted file to $ddate : $mdate
  SetFile -d "$ddate" "$dest"
  SetFile -m "$mdate" "$dest"
done
