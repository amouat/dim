#!/bin/bash
#Wrapper script that launches docker image with file argument mounted

#Directory in docker image we keep the current file in
WORKDIR=/workdir

if [[ $# == 1 ]]; then 
  #get full path
  ABSFILE=$(readlink -f $1)
  FILENAME=$(basename $ABSFILE)
  docker run -v $ABSFILE:$WORKDIR/$FILENAME -i -t amouat/wrvim $WORKDIR/$FILENAME
else
  echo "$0 expects exactly one file argument"
  exit 1
fi

