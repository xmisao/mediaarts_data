#!/bin/bash

rm -r 'tmp'
mkdir -p 'tmp/mediaarts_data'
git ls-files -z|xargs -0 -I{} cp --parents {} 'tmp/mediaarts_data'
cp -Ra data/* 'tmp/mediaarts_data/data'
rm 'tmp/mediaarts_data/data/README.md'
TAG=`git describe --abbrev=0`
PACKAGE="mediaarts_data_$TAG.tgz"
cd tmp
tar zcf "$PACKAGE" "mediaarts_data"
cd ..
mv "tmp/$PACKAGE" "packages/$PACKAGE"
