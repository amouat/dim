#!/bin/bash
#Wrapper script that launches docker image with file argument mounted

#Directory in docker image we keep the current file in
WORKDIR=/workdir

if [[ $# == 1 ]]; then 
  #get full path
  FILENAME=$(basename $1) 
  ABSFILE=$( cd $(dirname $1); pwd)/$FILENAME
  docker run -v $ABSFILE:$WORKDIR/$FILENAME -i -t amouat/dim:latest $WORKDIR/$FILENAME
else
  echo "$0 expects exactly one file argument"
  exit 1
fi

