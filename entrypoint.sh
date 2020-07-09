#!/bin/bash

update-alternatives --remove python /usr/bin/python2
update-alternatives --install /usr/bin/python python /usr/bin/python3 10
gem install fpm
fpm -s python -t deb --iteration $(date +%s) --python-package-name-prefix python3 setup.py
cp -vf *.deb /packages/$dist

