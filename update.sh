#!/bin/sh

HEAR=$(pwd)
DEST=$(dirname $HEAR)/notes

rm -rf $DEST/*

for d in $HEAR/*
do
    [ ! -d $d ] && continue
    item=$(basename $d)
    dest_item=$DEST/$item
    echo $item
    mdbook build $d > /dev/null
    mkdir -p $dest_item
    cp -rT $d/book/ $dest_item
done

echo "done."
