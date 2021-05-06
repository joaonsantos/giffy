#!/bin/bash
set -e

# In case there is no args given
if [ $# -lt 2 ]
then
  echo "usage: $0 <input> <output>"
  exit 1
fi

echo "Starting conversion to gif"
echo "Please wait a moment..."
echo ""
ffmpeg -v error -y -i $1 -pix_fmt rgb8 $2

name="`echo "$2"|cut -d. -f1`"
gifsicle --optimize=3 --output "${name}-opt.gif" --resize-height 720 $2


echo "Success!"
