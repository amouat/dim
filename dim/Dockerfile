# Gdim
#
# A dockerized Vim for editing text files.
#
# Note that this version uses plain vim, a gvim version is also available.
#
# See https://github.com/amouat/dim

FROM      ubuntu
MAINTAINER Adrian Mouat <adrian@adrianmouat.com>

ENV REFRESHED_ON 2014-10-09

VOLUME [ "/vim_tmp" ]
RUN mkdir /workdir

RUN apt-get update
RUN apt-get install -qq git
RUN apt-get install -y vim
RUN git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ADD https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim /.vim/colors/solarized.vim
COPY vimrc /.vimrc

RUN vim +PluginInstall +qall
ENTRYPOINT [ "vim" ]
