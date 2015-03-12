# Gdim
#
# A dockerized Vim for editing text files.
#
# Note that this version uses plain vim, a gvim version is also available.
#
# See https://github.com/amouat/dim

FROM      ubuntu
MAINTAINER Adrian Mouat <adrian@adrianmouat.com>

VOLUME [ "/vim_tmp" ]
RUN mkdir /workdir

RUN apt-get update && \
    apt-get install -qq git vim && \
    rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ADD https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim /.vim/colors/solarized.vim
COPY vimrc /.vimrc
COPY asciidoc.vim /.vim/syntax/

RUN vim +PluginInstall +qall

ENTRYPOINT [ "vim" ]
