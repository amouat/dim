# Gdim
#
# A dockerized Vim for editing text files.
#
# Note that this version uses gvim, a plain vim version is also available.
#
# See https://github.com/amouat/dim

FROM       amouat/dim
MAINTAINER Adrian Mouat <adrian@adrianmouat.com>

ENV REFRESHED_ON 2014-10-09
ENV DISPLAY :0

RUN apt-get install -y vim-gnome
ENTRYPOINT [ "gvim", "-f" ]
