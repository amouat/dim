#!/bin/bash
#Wrapper script that launches docker image with file argument mounted

#Directory in docker image we keep the current file in
WORKDIR=/workdir

if [[ $# == 1 ]]; then 
  #get full path
  FILE=$(readlink -f $1)
  docker run -v $FILE:$WORKDIR/$1 -i -t amouat/wrvim $WORKDIR/$1
else
  echo "$0 expects exactly one file argument"
  exit 1
fi

