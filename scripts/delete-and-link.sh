#!/usr/bin/env bash


echo "Linking $1 to $2"
rm $2
ln -s $1 $2
