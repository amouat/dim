#!/bin/bash
#Wrapper script that launches docker image with file argument mounted
#and handles X session stuff

#Directory in docker image we keep the current file in
WORKDIR=/workdir

#Stuff for handling connecting to X session
XSOCK=/tmp/.X11-unix/

if [[ $# == 1 ]]; then 
  XAUTH=$(mktemp -t docker.xauth.XXXXXXXXXX) || { echo "Failed to create temporary file";  exit 1;}
  xauth nlist :0 | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

  #should create file if it doesn't exist

  #get full path
  FILENAME=$(basename $1) 
  ABSFILE=$( cd $(dirname $1); pwd)/$FILENAME
  docker run -v $ABSFILE:$WORKDIR/$FILENAME -v $XSOCK:$XSOCK -v $XAUTH:$XAUTH -e XAUTHORITY=$XAUTH -i -t amouat/gdim:latest $WORKDIR/$FILENAME
  rm $XAUTH
else
  echo "$0 expects exactly one file argument"
  exit 1
fi

