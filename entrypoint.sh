#!/bin/bash

dist=${dist:-''}

gem install fpm
fpm -s python \
    -t deb \
    --iteration "$(date +%s)" \
    --python-package-name-prefix python3 \
    --python-bin python3 \
    setup.py
cp -vf ./*.deb "/packages/${dist}"
