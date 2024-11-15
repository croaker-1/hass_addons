#!/bin/sh

ARCH=$1

echo "ARCH:"$ARCH 1>&2
BASE="https://otgw.tclcode.com/download/tclkit"
URL=""
case $ARCH in
   amd64)
      URL=$BASE"-x64"
      ;;
   armhf)
      URL=$BASE"-ahf"
      ;;
   i386)
      URL=$BASE
      ;;
   aarch64)
      URL=$BASE"-aarch64"
      ;;
   *)
     echo "unsupported architecture!"
     exit -1 1>&2
     ;;
esac
echo $URL
