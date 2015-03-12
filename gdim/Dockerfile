# Gdim
#
# A dockerized Vim for editing text files.
#
# Note that this version uses gvim, a plain vim version is also available.
#
# See https://github.com/amouat/dim

FROM       amouat/dim
MAINTAINER Adrian Mouat <adrian@adrianmouat.com>

ENV DISPLAY :0
 
RUN apt-get update && \
    apt-get install -y libcanberra-gtk-module vim-gnome && \
    rm -rf /var/lib/apt/lists/*
ENTRYPOINT [ "gvim", "-f" ]
