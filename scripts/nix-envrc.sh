#!/bin/sh
touch .envrc
echo -e "use nix" >> .envrc
direnv allow 
