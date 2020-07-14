#!/bin/bash

dis=${dis:-''}
rel=${rel:-''}

dest="/packages/$dis/$rel"

[[ $rel == 'jessie' ]] \
  && gem install  ffi --version 1.12.2

gem install fpm

fpm -s python \
    -t deb \
    --iteration "$(date +%s)" \
    --python-package-name-prefix python3 \
    --python-bin python3 \
    setup.py

[[ -d $dest ]] || mkdir -pv "$dest"

cp -vf ./*.deb "$dest"
