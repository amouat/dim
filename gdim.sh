#!/bin/bash
#Wrapper script that launches docker image with file argument mounted
#and handles X session stuff

#Directory in docker image we keep the current file in
WORKDIR=/workdir

#Stuff for handling connecting to X session
#TODO: make these files unique and delete on exit
XSOCK=/tmp/.X11-unix/
XAUTH=/tmp/.docker.xauth

#Note that this seems to complain about file not existing the first time
xauth nlist :0 | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

#should create file if it doesn't exist

if [[ $# == 1 ]]; then 
  #get full path
  ABSFILE=$(readlink -f $1)
  FILENAME=$(basename $ABSFILE)
  docker run -v $ABSFILE:$WORKDIR/$FILENAME -v $XSOCK:$XSOCK -v $XAUTH:$XAUTH -e XAUTHORITY=$XAUTH -i -t amouat/gdim $WORKDIR/$FILENAME
else
  echo "$0 expects exactly one file argument"
  exit 1
fi

