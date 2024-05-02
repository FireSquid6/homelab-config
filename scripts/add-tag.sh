#!/usr/bin/env nix-shell
#!nix-shell -i bash -p git


if [ -z "$1" ]; then
    echo "Usage: $0 <tag>"
    exit 1
fi

git tag -a $1 -m "version $1"
git push origin $1

