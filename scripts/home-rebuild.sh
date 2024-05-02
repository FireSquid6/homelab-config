#!/bin/sh
export NIXPKGS_ALLOW_UNFREE=1
export NIXPKGS_ALLOW_INSECURE=1
home-manager switch -f "/etc/nixos/home.nix"
